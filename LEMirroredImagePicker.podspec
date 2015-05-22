#
# Be sure to run `pod lib lint LEMirroredImagePicker.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LEMirroredImagePicker"
  s.version          = "0.1.0"
  s.summary          = "A simply class to mirror the image of front camera image picker"
  s.homepage         = "https://github.com/lucasecf/LEMirroredImagePicker"
  s.license          = 'MIT'
  s.author           = { "Lucas Eduardo" => "lucasecf@gmail.com" }
  s.source           = { :git => "https://github.com/lucasecf/LEMirroredImagePicker.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'LEMirroredImagePicker' => ['Pod/Assets/*.png']
  }

end
