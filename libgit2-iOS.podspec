#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "libgit2-iOS"
  s.version          = "0.0.1"
  s.summary          = "Attempt to get libgit2 to build as a cocoapod"
  s.description      = <<-DESC
                        Attempt to get libgit2 to build as a cocoapod.
                        Not currently working.
                       DESC
s.homepage           = "https://github.com/beardo/libgit2-iOS"
  #s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Daniel Sullivan" => "code+git@danielsullivan.me" }
  s.source           = { :git => "https://github.com/beardo/libgit2-iOS.git", :tag => s.version.to_s }
  #s.social_media_url = 'https://twitter.com/EXAMPLE'

  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.prepare_command = 'mkdir -p libgit2/build && cd libgit2/build && cmake .. -DBUILD_SHARED_LIBS=OFF && make'
  s.vendored_libraries = 'libgit2/build/libgit2.a'
  #s.source_files = 'libgit2/build/'
  #s.resources = 'Assets/*.png'

  #s.ios.exclude_files = 'Classes/osx'
  #s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  # s.dependency 'JSONKit', '~> 1.4'
end
