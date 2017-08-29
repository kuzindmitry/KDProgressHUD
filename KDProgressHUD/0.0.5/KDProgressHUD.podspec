

Pod::Spec.new do |s|

s.name         = "KDProgressHUD"
s.version      = "0.0.5"
s.summary      = "Porgress HUD"

s.description  = <<-DESC
KDProgressHUD - Porgress HUD for iOS (Swift)
DESC

s.homepage     = "https://github.com/kuzindmitry"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "Dmitry Kuzin" => "dmitry@kuzin.es" }
s.source       = { :git => "https://github.com/kuzindmitry/KDProgressHUD.git", :tag => "#{s.version}" }
s.ios.deployment_target = '8.2'
s.source_files = "KDProgressHUD/**/*.{swift}"

end
