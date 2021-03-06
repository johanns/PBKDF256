# -*- encoding: utf-8 -*-

require File.expand_path('../lib/pbkdf256/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "pbkdf256"
  gem.version       = PBKDF256::VERSION
  gem.summary       = %q{A fast, native PBKDF2-HMAC-SHA256 Ruby gem.}
  gem.description   = %q{A very simple, but fast (native) RFC compliant PBKDF2-HMAC-SHA256 ruby gem based on Colin Percival's C implementation.}
  gem.license       = "MIT"
  gem.authors       = ["Johanns Gregorian"]
  gem.email         = "io+pbkdf256@jsani.com"
  gem.homepage      = "https://github.com/johanns/PBKDF256#readme"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
  gem.extensions    = ['ext/core/extconf.rb']

  gem.add_development_dependency "rake-compiler"
  gem.add_development_dependency 'rspec', '~> 2.4'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
  gem.add_development_dependency 'yard', '~> 0.8'
end
