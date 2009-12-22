require 'adhoc/version'

module Adhoc
  autoload :Service, 'adhoc/service'

  autoload :AMQP,    'adhoc/amqp'
  autoload :DNSSD,   'adhoc/dnssd'
  autoload :XMPP,    'adhoc/xmpp'
end
