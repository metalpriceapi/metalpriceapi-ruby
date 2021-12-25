# frozen_string_literal: true

require 'metalpriceapi/version'

Gem::Specification.new do |s|
  s.name = 'metalpriceapi'
  s.version = MetalpriceAPI::VERSION
  s.authors = ['MetalpriceAPI']
  s.email = 'contact@metalpriceapi.com'
  s.files = Dir['{bin,lib}/**/*'] + ['README.md', 'LICENSE.md']
  s.require_paths = ['lib']
  s.homepage = 'http://github.com/metalpriceapi/metalpriceapi-ruby'
  s.licenses = ['MIT']
  s.summary = 'Official MetalpriceAPI Ruby client.'
  s.add_dependency 'faraday', '>= 1.0.0'
  s.add_dependency 'faraday_middleware'
end
