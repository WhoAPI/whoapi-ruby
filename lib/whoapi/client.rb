module WhoAPI
  class Client

    def initialize(api_key)
      @params = { apikey: api_key }
    end

    def domain_taken?(domain_name)
       request('taken', { domain: domain_name })
    end

    def blacklist_info(domain_name)
      request('blacklist', { domain: domain_name })
    end

    def whois_info(domain_name)
      request('whois', { domain: domain_name })
    end

    def ssl_info(domain_name)
      request('cert', { domain: domain_name })
    end

    def social_availability(domain_name)
      request('social', { domain: domain_name })
    end

    def meta_info(domain_name)
      request('meta', { domain: domain_name })
    end

    def dns_zone(domain_name)
      request('dnszone', { domain: domain_name })
    end

    def ranking_info(domain_name, full_url = nil)
      request('ranks', build_params(domain_name, :fullurl, full_url))
    end

    def screenshot(domain_name, full_url = nil)
      request('screenshot', build_params(domain_name, :fullurl, full_url))
    end

    def hostname_info(domain_name, ip = nil)
      request('hostname', build_params(domain_name, :ip, ip))
    end

    def geo_data(domain_name, ip = nil)
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
