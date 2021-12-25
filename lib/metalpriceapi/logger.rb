# frozen_string_literal: true

require 'logger'

module MetalpriceAPI
  class Logger < ::Logger
    def self.logger
      @logger ||= begin
        logger = new STDOUT
        logger.level = Logger::WARN
        logger
      end
    end
  end
end
