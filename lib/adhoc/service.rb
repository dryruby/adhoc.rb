module Adhoc
  ##
  # Adhoc service.
  class Service
    def self.for(type)
      case type
        when Symbol  then const_get(type.to_s.upcase)
        when String  then const_get(type.upcase)
        when Service then type.class
        when Class   then type
      end
    end

    def initialize(result = nil)
      @result = result
    end

    def self.type
      const_get(:DNSSD_TYPE)
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
        "http://#{@result.target}:#{@result.port}/" # TODO: path
      end
    end

    ##
    # Internet Printing Protocol (IPP)
    class IIP < Service
      DNSSD_TYPE = "_ipp._tcp."
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
    # Secure Shell (SSH)
    class SSH < Service
      DNSSD_TYPE = "_ssh._tcp."
    end
  end
end
