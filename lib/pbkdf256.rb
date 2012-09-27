require 'pbkdf256/version'
require 'pbkdf256_n'

module PBKDF256
  extend self

  class << self
    alias :dk :hmac_sha256
    alias :pbkdf2_sha256 :hmac_sha256 
  end
end
