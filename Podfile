# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'GitHubPocket' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'SnapKit'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Kingfisher'

  target 'GitHubPocketTests' do
    inherit! :search_paths
  end

  target 'GitHubPocketUITests' do  
  end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['EXCLUDED_SOURCE_FILE_NAMES'] = 'Pods/**'
      end
    end
  end

end
