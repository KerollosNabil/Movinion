platform :ios, '9.0'

target 'Movies App' do

pod 'SDWebImage', '~> 4.0'
pod 'AFNetworking', '~> 3.0'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF'] = 'NO'
        end
    end
end
