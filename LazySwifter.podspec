#
# Be sure to run `pod lib lint LazySwifter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'LazySwifter'
    s.version          = '2.0.1'
    s.summary          = 'For me when I\'m too lazy for write some code'
    s.homepage         = 'https://github.com/quocnb/LazySwifter'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Quoc Nguyen' => 'quocnb.vnu@gmail.com' }
    s.source           = { :git => 'https://github.com/quocnb/LazySwifter.git', :tag => s.version.to_s }
    s.ios.deployment_target = '9.0'
    s.swift_version = '4.2'
    s.source_files = 'LazySwifter/**/*.swift'
    s.module_name = 'LazySwifter'
end
