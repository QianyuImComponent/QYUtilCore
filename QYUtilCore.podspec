#
# Be sure to run `pod lib lint QYUtilCore.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QYUtilCore'
  s.version          = '0.0.1'
  s.summary          = '项目公用基础库'


  s.description      = <<-DESC
TODO: 项目公用基础库，单独模块.
                       DESC

  s.homepage         = 'https://github.com/QianyuImComponent/QYUtilCore'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qianyuIm' => '1040583846@qq.com' }
  

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'
  s.source           = { :git => 'https://github.com/QianyuImComponent/QYUtilCore.git', :tag => s.version.to_s }
  
  s.subspec 'Base' do |sp|
    sp.source_files  = 'QYUtilCore/Classes/Base/*/*'
    sp.dependency 'HBDNavigationBar','~> 1.7.7'
    sp.dependency 'UINavigation-SXFixSpace', '~> 1.2.4'
    sp.dependency 'QYUtilCore/Dependent'
  end
  
  s.subspec 'Route' do |sp|
    sp.source_files  = 'QYUtilCore/Classes/Route/*'
    sp.dependency 'URLNavigator', '~> 2.3.0'
  end
  
  s.subspec 'Dependent' do |sp|
    sp.source_files  = 'QYUtilCore/Classes/Dependent/*'
    sp.dependency 'QYUtilCore/Extensions'
  end
  
  s.subspec 'Extensions' do |sp|
      sp.source_files  = 'QYUtilCore/Classes/Extensions/*'
      
  end
  
end
