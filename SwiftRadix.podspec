Pod::Spec.new do |s|
  s.name = 'SwiftRadix'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'A lightweight library useful for translating integers to and from radix strings (binary, hex, octal or any base) using simple, clean functional syntax. (formerly known as SwiftHex)'
  s.homepage = 'https://github.com/orchetect/SwiftRadix'
  s.authors = { 'Steffan Andrews' => 'http://www.orchetect.com' }
  s.social_media_url = 'https://twitter.com/orchetect'
  s.source = { :git => 'https://github.com/orchetect/SwiftRadix.git', :tag => '1.0.0' }
  
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'Source/SwiftRadix/*.swift'

  s.swift_version = '5.0'
end
