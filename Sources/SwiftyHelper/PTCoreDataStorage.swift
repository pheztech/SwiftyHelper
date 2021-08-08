//
//  PTCoreDataStorage.swift
//  SwiftyHelper
//
//  Created by Ken Pham on 7/10/21.
//  Copyright © 2021 Phez Technologies. All rights reserved.
//

import Foundation
import CoreData
import os

/// Base class to access CoreData models
open class PTCoreDataStorage: NSObject {
    public let container: NSPersistentContainer
    private var error: Error?
    
    public init (name: String, in bundle: Bundle) {
        let url = bundle.url(forResource: name, withExtension: ".momd")!
        let model = NSManagedObjectModel(contentsOf: url)!
        self.container = NSPersistentContainer(name: name, managedObjectModel: model)
        
        super.init()
        self.load()
    }
    
    public init (name: String, inMemory: Bool = false) {
        self.container = NSPersistentContainer(name: name)
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        super.init()
        self.load()
    }
    
    /**
     Perform and wait for the block to complete on a background context.
     The block is only called if the error is null.
     - parameter block: Callback with the context that the task is being performed on
     */
    public func performAndWait (_ block: (NSManagedObjectContext) -> ()) {
        let context = container.newBackgroundContext()
        self.performAndWait(on: context) {
            block(context)
        }
    }
    
    /**
     Perform and wait for the block to complete on the provided context.
     The block is only called if the error is null.
     - parameter block: Callback of the task that will be performed on the context
     */
    public func performAndWait (on context: NSManagedObjectContext, block: () -> ()) {
        guard let error = self.error else {
            return context.performAndWait(block)
        }
        self.logError(error)
    }
    
    /**
     Perform the block on a background context.
     This is an asynchronous method.
     The block is only called if the error is null.
     - parameter block: Callback with the context that the task is being performed on
     */
    public func perform (_ block: @escaping (NSManagedObjectContext) -> ()) {
        let context = container.newBackgroundContext()
        self.perform(on: context) {
            block(context)
        }
    }
    
    /**
     Perform the block on the provided context.
     This is an asynchronous method.
     The block is only called if the error is null.
     - parameter block: Callback of the task that will be performed on the context
     */
    public func perform (on context: NSManagedObjectContext, block: @escaping () -> ()) {
        guard let error = self.error else {
            return context.perform(block)
        }
        self.logError(error)
    }
    
    /**
     Executes the provided fetch request on the provided context
     - warning: This method is NOT thread safe. It should be called within the provided context's perform block
     */
    public func fetch<T: NSFetchRequestResult> (_ context: NSManagedObjectContext, request: NSFetchRequest<T>) -> [T]? {
        do {
            return try context.fetch(request)
        } catch {
            self.logError(error)
            return nil
        }
    }
    
    /**
     Saves the `context` if there are any changes.
     - warning: This method is NOT thread safe. It should be called within the provided context's perform block
     */
    public func saveContext (_ context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
                Logger.coreData.info("[\(type(of: self))] Saved Changes")
            } catch {
                self.logError(error)
            }
        }
    }
    
    private func load () {
        container.loadPersistentStores { _, error in
            self.error = error
        }
    }
    
    private func logError (_ error: Error) {
        Logger.coreData.critical("[\(type(of: self))] \(String(describing: error))")
    }
}
