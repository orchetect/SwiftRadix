Pod::Spec.new do |s|
  s.name = 'SwiftRadix'
  s.version = '1.0.0'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'Source/SwiftRadix/*.swift'

  s.swift_version = '5.0'
end
