import XCTest
@testable import SwiftyHelper

final class SwiftyHelperTests: XCTestCase {
    static var allTests = [
        ("Number Formatter", testNumberFormatter),
    ]
    
    func testNumberFormatter () {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        
        let value: Double = 0.0863
        XCTAssertEqual(formatter.string(from: value), formatter.string(from: NSNumber(value: value)))
    }
}
