# frozen_string_literal: true

module MetalpriceAPI
  class Client
    include Connection
    include Request
    include Endpoints

    attr_accessor(*Config::ATTRIBUTES)

    def initialize(options = {})
      MetalpriceAPI::Config::ATTRIBUTES.each do |key|
        send("#{key}=", options[key] || MetalpriceAPI.config.send(key))
      end
      @logger ||= MetalpriceAPI::Logger.logger
    end

    class << self
      def configure
        block_given? ? yield(Config) : Config
      end

      def config
        Config
      end
    end
  end
end
