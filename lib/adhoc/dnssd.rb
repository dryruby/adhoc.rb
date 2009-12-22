require 'dnssd'

module Adhoc
  ##
  # DNS-SD service discovery.
  module DNSSD
    ##
    # Discovers DNS-SD services synchronously.
    def self.discover!(service, options = {}, &block)
      query = discover(service, options, &block)
      if options[:timeout]
        sleep options[:timeout].to_f
      else
        sleep # wait indefinitely
      end
      query.stop
    end

    ##
    # Discovers DNS-SD services asynchronously.
    def self.discover(service, options = {}, &block)
      service = Service.for(service)
      ::DNSSD.browse(service.type) do |reply|
        ::DNSSD.resolve(reply) do |reply|
          block.call(service.new(reply))
        end
      end
    end
  end
end
