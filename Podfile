# Uncomment the next line to define a global platform for your project
 platform :ios, '12.0'

# Pods for PeeCheck
def common_pods
    pod 'SwiftLint'
    pod 'SwiftIcons'
    pod 'ChameleonFramework/Swift', :git => 'https://github.com/ViccAlexander/Chameleon.git'
    pod 'Toast-Swift'
    pod 'RealmSwift'
    pod 'SwiftDate'
    pod 'Cards'
    pod 'SnapKit'
    pod 'MaterialComponents'
end

# Pods for PeeCheck Testing
def test_pods
    pod "Quick"
    pod "Nimble"
    pod "Nimble-Snapshots"
end

target 'PeeCheck' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  common_pods

  target 'PeeCheckTests' do
    inherit! :search_paths
    test_pods
    # Pods for testing
  end

  target 'PeeCheckUITests' do
    inherit! :search_paths
    test_pods
    # Pods for testing
  end

end
