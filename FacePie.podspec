Pod::Spec.new do |s|
  s.name         = "FacePie"
  s.version      = "0.1"
  s.summary      = "An iOS Image category to merge multiple profile images"
  s.homepage     = "http://www.appdios.com"
  s.author       = { 'Sumit Kumar' => 'sumit@appdios.com' }
  s.source       = { :git => "https://github.com/appdios/FacePie.git", :tag => s.version.to_s }
  s.platform     = :ios
  s.source_files = 'FacePie/Classes/*.{h,m}'
  s.requires_arc = true
end
