Pod::Spec.new do |s|
  s.name         = "SKArchCutter"
  s.version      = "0.0.6"
  s.summary      = "A arch cutter."
  s.description  = <<-DESC
			这是一个半圆切割渲染工具，避免系统圆角造成的离屏渲染的问题, 完美兼容Masonry&frame&border
                   DESC

  s.homepage     = "https://github.com/shevakuilin/SKArchCutter"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "ShevaKuilin" => "shevakuilin@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/shevakuilin/SKArchCutter.git", :tag => "0.0.6" }
  s.source_files  = "Source/SKArchCutter/*.{h,m}"

end
