#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "libgit2-iOS"
  s.version          = "0.0.2"
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
  s.requires_arc = true

  s.prepare_command = <<-CMD
                          rm -rf libgit2/include/git2/inttypes.h
                          rm -rf libgit2/include/git2/stdint.h
                          rm -rf libgit2/src/win32
                          mkdir -p libgit2/build
                          cd libgit2/build
                          cmake -DCMAKE_TOOLCHAIN_FILE=../toolchain/ios7_xcode.cmake -DCMAKE_SIZEOF_VOID_P=4 -GXcode ..
                          xcodebuild
                          xcodebuild install
                        CMD
  s.header_mappings_dir = 'libgit2/include/**/'
  s.public_header_files = 'libgit2/include/**/*.h', 'Headers/*.h'
  s.vendored_libraries = 'libgit2/build/Debug/libgit2.dylib', 'libgit2/Libraries/*'
end
