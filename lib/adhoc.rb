require 'adhoc/version'

module Adhoc
  autoload :Service, 'adhoc/service'

  autoload :AMQP,    'adhoc/amqp'
  autoload :DNSSD,   'adhoc/dnssd'
  autoload :XMPP,    'adhoc/xmpp'

  ##
  # Discovers services synchronously.
  def self.discover!(service, options = {}, &block)
    DNSSD.discover!(service, options, &block)
  end

  ##
  # Discovers services asynchronously.
  def self.discover(service, options = {}, &block)
    DNSSD.discover(service, options, &block)
  end
end
