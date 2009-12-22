module Adhoc
  module VERSION
    MAJOR = 0
    MINOR = 1
    TINY  = 0
    EXTRA = nil

    STRING = [MAJOR, MINOR, TINY].join('.')
    STRING << "-#{EXTRA}" if EXTRA

    def self.to_s()   STRING end
    def self.to_str() STRING end
  end
end
