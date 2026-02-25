# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
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
  s.required_ruby_version = '>= 2.7'
  s.add_dependency 'faraday', '~> 1.0', '>= 1.0.0'
  s.add_dependency 'faraday_middleware', '~> 1.0'
end
