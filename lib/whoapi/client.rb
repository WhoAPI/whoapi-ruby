
require 'uri'
require 'json'
require_relative 'request'

module WhoAPI
  class Client

    def initialize(api_key)
      @params = { apikey: api_key }
    end

    def taken?(domain_name)
      result = request('taken', { domain: domain_name })
      result == '1' ? true : false
    end

    def blacklist(domain_name)
      request('blacklist', { domain: domain_name })
    end

    def whois(domain_name)
      request('whois', { domain: domain_name })
    end

    def ssl_info(domain_name)
      request('cert', { domain: domain_name })
    end

    def social_availability(domain_name)
      request('social', { domain: domain_name })
    end

    def meta(domain_name)
      request('meta', { domain: domain_name })
    end

    def dns_zone(domain_name)
      request('dnszone', { domain: domain_name })
    end

    def ranks(domain_name, fullurl = nil)
      request('ranks', build_params(domain_name, :fullurl, fullurl))
    end

    def screenshot(domain_name, fullurl = nil)
      request('screenshot', build_params(domain_name, :fullurl, fullurl))
    end

    def hostname(domain_name, ip = nil)
      request('hostname', build_params(domain_name, :ip, ip))
    end

    def geo(domain_name, ip = nil)
      request('geo', build_params(domain_name, :ip, ip))
    end

    private

    def request(type, params)
      WhoAPI::Request.new(type, @params.dup.merge(params)).run
    end

    def build_params(domain_name, label, value)
      default = { domain: domain_name }
      value ? default.merge({ label => value }) : default
    end

  end
end
