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
      # If server was explicitly passed, update endpoint accordingly
      if options.key?(:server)
        self.endpoint = MetalpriceAPI::SERVERS.fetch(options[:server], MetalpriceAPI::SERVERS['us'])
      end
    end

    def setServer(server)
      self.endpoint = MetalpriceAPI::SERVERS.fetch(server, MetalpriceAPI::SERVERS['us'])
      @connection = nil  # reset memoized connection
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
