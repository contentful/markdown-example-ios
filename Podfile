#!/usr/bin/ruby

source 'https://github.com/CocoaPods/Specs'
source 'https://github.com/contentful/CocoaPodsSpecs'

use_frameworks!

platform :ios, '8.0'

target 'Markdown' do

  pod 'cmark', :inhibit_warnings => true
  pod 'CocoaMarkdown', :git => 'https://github.com/indragiek/CocoaMarkdown', :branch => 'master'
  pod 'Contentful', '~> 0.3.0'
  pod 'MMMarkdown'
  pod 'Ono'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
