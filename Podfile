# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'

target 'MeditationAppUI' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for MeditationAppUI
  pod 'Alamofire', '~> 5.9'
  pod 'FirebaseFirestore', '~> 10.22'
  pod 'FirebaseAuth', '~> 10.22'
  pod 'FirebaseAnalytics'
  pod 'SDWebImageSwiftUI'
  
  target 'MeditationAppUITests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  target 'MeditationAppUIUITests' do
    # Pods for testing
  end
  
end

target 'MeditationDarkAppUI' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for MeditationDarkAppUI
  
  target 'MeditationDarkAppUITests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  target 'MeditationDarkAppUIUITests' do
    # Pods for testing
  end
  
end


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
            config.build_settings['PROVISIONING_PROFILE_SPECIFIER'] = ''
            config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
            config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
            config.build_settings["IPHONEOS_DEPLOYMENT_TARGET"] = "15.0"
        end
    end
end
