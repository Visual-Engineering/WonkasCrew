Pod::Spec.new do |s|
  s.name         = "WonkaKit"
  s.version      = "0.0.1"
  s.summary      = "WonkaCrew logic"
  s.homepage     = "http//www.visual-engin.com"
  s.license      = "MIT"
  s.author             = { "Jordi Serra" => "jserra@visual-engin.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform     = :ios, "9.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :path => "." }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source_files  = "**/*.{swift,m,h}"

  # ――― Dependencies ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.dependency "BSWFoundation"
  s.dependency "JWTDecode"
  s.dependency "KeychainAccess"

end
