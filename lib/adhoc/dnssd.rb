require 'dnssd'

module Adhoc
  ##
  # DNS-SD service discovery.
  module DNSSD
    ##
    # Discovers services of a given type using DNS-SD.
    def self.discover(type, &block)
      service = Service.for(type)
      ::DNSSD.browse(service.type) do |reply|
        ::DNSSD.resolve(reply) do |reply|
          block.call(service.new(reply))
        end
      end
    end
  end
end
