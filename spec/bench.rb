require 'openssl'
require 'pbkdf2'
require 'pbkdf256'

Benchmark.bm do |x|
  x.report { OpenSSL::PKCS5.pbkdf2_hmac("pleaseletmein", "SodiumChloride", 100000, 64, 'sha256') }
  x.report { PBKDF256.pbkdf2_sha256("pleaseletmein", "SodiumChloride", 100000, 64) }
  x.report { PBKDF2.new(:password => "pleaseletmein", :salt => "SodiumChloride", :iterations => 100000, :key_length => 64).value }
end

Benchmark.bm do |x|
  x.report { OpenSSL::PKCS5.pbkdf2_hmac("pleaseletmein", "SodiumChloride", 2000, 64, 'sha256') }
  x.report { PBKDF256.pbkdf2_sha256("pleaseletmein", "SodiumChloride", 2000, 64) }
  x.report { PBKDF2.new(:password => "pleaseletmein", :salt => "SodiumChloride", :iterations => 2000, :key_length => 64).value }
end
