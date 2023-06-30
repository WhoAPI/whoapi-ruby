# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'whoapi/version'

Gem::Specification.new do |spec|
  spec.name          = "whoapi"
  spec.version       = WhoAPI::VERSION
  spec.authors       = ["Thibault Denizet"]

  spec.summary       = %q{Wrapper for the WhoAPI service.}
  spec.description   = %q{WhoAPI.com offers a range of services allowing the querying of domain name data. Track everything and never miss a renewal anymore (domain name, certificates, blacklists, etc).}
  spec.homepage      = "https://github.com/whoapi/whoapi-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.13.7"
  spec.add_development_dependency "bundler", ">= 2.2.33"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 1.22"
  spec.add_development_dependency "vcr", "~> 3.0"
end
