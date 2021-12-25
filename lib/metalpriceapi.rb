# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'json'
require 'logger'

require_relative 'metalpriceapi/version'
require_relative 'metalpriceapi/logger'

require_relative 'metalpriceapi/errors/fault'

require_relative 'metalpriceapi/raise_error'
require_relative 'metalpriceapi/connection'
require_relative 'metalpriceapi/request'
require_relative 'metalpriceapi/config'
require_relative 'metalpriceapi/errors'
require_relative 'metalpriceapi/endpoints'
require_relative 'metalpriceapi/client'
