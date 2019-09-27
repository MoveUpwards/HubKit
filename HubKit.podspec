Pod::Spec.new do |s|
  s.name                      = "HubKit"
  s.version                   = "1.0.5"
  s.summary                   = "HubKit Framework"
  s.homepage                  = "https://github.com/MoveUpwards/HubKit.git"
  s.license                   = { :type => "MIT", :file => "LICENSE" }
  s.author                    = { "Move Upwards" => "contact@moveupwards.dev" }
  s.source                    = { :git => "https://github.com/MoveUpwards/HubKit.git", :tag => s.version.to_s }
  s.swift_version             = '5.0'
  s.ios.deployment_target     = "10.0"
  s.osx.deployment_target     = "10.13"
  s.source_files              = "Sources/**/*"
  s.frameworks                = "Foundation"

  s.dependency 'Offenbach'
end
