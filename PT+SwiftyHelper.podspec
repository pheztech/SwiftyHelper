Pod::Spec.new do |s|
    s.module_name       = "SwiftyHelper"
    s.name              = "PT+SwiftyHelper"
    s.version           = "0.1.7"
    s.summary           = "Helpful wrappers of basic functions and lower level iOS frameworks"
    s.homepage          = "https://github.com/KenLPham/"
    s.license           = { :type => "Custom", :file => "LICENSE.md" }
    s.author            = { "Ken Pham" => "ken@pheztech.com" }
    s.source            = { :git => "https://github.com/KenLPham/SwiftyHelper.git", :tag => s.version }
    s.social_media_url  = 'https://twitter.com/lilboipham'
    
    s.platform          = :ios, '12.0'
    s.requires_arc      = true
    s.swift_versions    = '5.0'
    
    s.source_files      = 'Sources/SwiftyHelper/**/*.swift'
    
    s.frameworks        = 'Foundation'
end

