#
# Be sure to run `pod lib lint FLEncrypt.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "TMEncrypt"
  s.version          = "1.0"
  s.summary          = "加密相关"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "加密相关类库封装"

  s.homepage         = "https://github.com/Tovema-iOS/TMEncrypt"
  s.license          = 'MIT'
  s.author           = { 'CodingPub' => 'lxb_0605@qq.com' }
  s.source           = { :git => "https://github.com/Tovema-iOS/TMEncrypt.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  
  s.library = 'z'
end
