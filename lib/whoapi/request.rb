require 'httparty'
require_relative 'error'

module WhoAPI
  class Request
    BASE_URL = 'api.whoapi.com'

    def initialize(type, params)
      @type = type
      @params = params
    end

    def run
      resp = HTTParty.get("http://#{BASE_URL}/#{query}")
      json = JSON.parse(resp.body)
      check_response(resp, json)
      json
    end

    private

    def check_response(resp, json)
      raise WhoAPI::Error.new("HTTP #{resp.code}", json) if resp.code != 200

      unless json['status'] == '0'
        raise WhoAPI::Error.new(json['status'], json['status_desc'])
      end
    end

    def query
      @query ||= build_query
    end

    def build_query
      @params.each_with_object("?r=#{@type}") { |(k, v), q| q << "&#{k}=#{v}" }
    end

  end
end
