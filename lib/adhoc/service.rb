module Adhoc
  ##
  # Adhoc service.
  class Service
    ##
    # Enumerates known service types.
    # @yield [klass]
    # @yieldparam [Class]
    def self.each(&block)
      @@subclasses.each { |klass| block.call(klass) }
    end

    ##
    # @return [Class]
    def self.for(type)
      case type
        when Symbol  then const_get(type.to_s.upcase)
        when String  then const_get(type.upcase)
        when Service then type.class
        when Class   then type
      end
    end

    ##
    # @return [String]
    def self.type
      const_get(:DNSSD_TYPE)
    end

    ##
    # @return [Symbol]
    def self.to_sym
      name.to_s.split(':').last.downcase.to_sym
    end

    attr_accessor :reply

    def initialize(reply = nil)
      @reply = reply
    end

    def name()   reply.name end

    def to_url() to_uri end

    def to_uri() URI.parse(to_s) end

    def to_s
      scheme = self.class.name.split(':').last.downcase
      "#{scheme}://#{reply.target}:#{reply.port}"
    end

    protected

      @@subclasses = [] #:nodoc:

      def self.inherited(child) #:nodoc:
        @@subclasses << child
        super
      end

    ##
    # Advanced Message Queuing Protocol (AMQP)
    class AMQP < Service
      DNSSD_TYPE = "_amqp._tcp."
    end

    ##
    # Apple File Sharing (AFP)
    class AFP < Service
      DNSSD_TYPE = "_afpovertcp._tcp."
    end

    ##
    # Digital Audio Access Protocol (DAAP; aka iTunes Music Sharing)
    class DAAP < Service
      DNSSD_TYPE = "_daap._tcp."
    end

    ##
    # Digital Audio Control Protocol (DACP)
    class DACP < Service
      DNSSD_TYPE = "_dacp._tcp."
    end

    ##
    # File Transfer Protocol (FTP)
    class FTP < Service
      DNSSD_TYPE = "_ftp._tcp."
    end

    ##
    # Hypertext Transfer Protocol (HTTP)
    class HTTP < Service
      DNSSD_TYPE = "_http._tcp."

      def to_s
        url = "http://#{reply.target}"
        url << ":#{reply.port}" unless reply.port == 80
        url << (reply.text_record["path"] || "/")
      end
    end

    ##
    # Internet Printing Protocol (IPP)
    class IIP < Service
      DNSSD_TYPE = "_ipp._tcp."
    end

    ##
    # Internet Message Access Protocol (IMAP)
    class IMAP < Service
      DNSSD_TYPE = "_imap._tcp."
    end

    ##
    # Lightweight Directory Access Protocol (LDAP)
    class LDAP < Service
      DNSSD_TYPE = "_ldap._tcp."
    end

    ##
    # Network File System (NFS)
    class NFS < Service
      DNSSD_TYPE = "_nfs._tcp."
    end

    ##
    # Network Time Protocol (NTP)
    class NTP < Service
      DNSSD_TYPE = "_ntp._tcp."
    end

    ##
    # Post Office Protocol, Version 3 (POP3)
    class POP3 < Service
      DNSSD_TYPE = "_pop3._tcp."
    end

    ##
    # Session Initiation Protocol (SIP)
    class SIP < Service
      DNSSD_TYPE = "_sip._tcp."
    end

    ##
    # Server Message Block (SMB; aka Samba)
    class SMB < Service
      DNSSD_TYPE = "_smb._tcp."
    end

    ##
    # Secure File Transfer Protocol (SFTP)
    class SFTP < Service
      DNSSD_TYPE = "_sftp-ssh._tcp."
    end

    ##
    # SPARQL Protocol and RDF Query Language (SPARQL)
    class SPARQL < Service
      DNSSD_TYPE = "_sparql._tcp."
    end

    ##
    # Secure Shell (SSH)
    class SSH < Service
      DNSSD_TYPE = "_ssh._tcp."
    end

    ##
    # Trivial File Transfer Protocol (TFTP)
    class TFTP < Service
      DNSSD_TYPE = "_tftp._tcp."
    end

    ##
    # Extensible Messaging and Presence Protocol (XMPP)
    #
    # @see http://tools.ietf.org/html/rfc3920#section-14.3
    class XMPP < Service
      DNSSD_TYPE = "_xmpp-client._tcp."
    end
  end
end
