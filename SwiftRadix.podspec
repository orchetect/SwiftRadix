Pod::Spec.new do |spec|
  spec.name = 'SwiftRadix'
  spec.version = '1.3.1'
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.summary = 'A Swift library for translating integers to/from radix strings (binary, hex, octal, etc.) using simple functional syntax.'
  spec.homepage = 'https://github.com/orchetect/SwiftRadix'
  spec.authors = { 'Steffan Andrews' => 'https://github.com/orchetect' }
  spec.source = { :git => 'https://github.com/orchetect/SwiftRadix.git', :tag => spec.version.to_s }
  
  spec.osx.deployment_target = '10.13'
  spec.ios.deployment_target = '12.0'
  spec.tvos.deployment_target = '12.0'
  spec.watchos.deployment_target = '5.0'

  spec.source_files = 'Sources/**/*.swift'

  spec.swift_version = '5.1'
end