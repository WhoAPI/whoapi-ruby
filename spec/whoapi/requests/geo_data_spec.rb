require 'spec_helper'

describe 'WhoAPI::Client.geo_data' do

  let(:api_key) { ENV['API_KEY'] }
  let(:client) { WhoAPI::Client.new(api_key) }

  let(:output) do
    {
      ip: "52.32.117.162",
      geo_cc: "us",
      geo_country: "United States",
      geo_city: nil,
      geo_latitude: nil,
      geo_longitude: nil
    }
  end

  it 'receives the domain name geo data' do
    VCR.use_cassette("geo_data") do
      expect(client.geo_data('whoapi.com')).to eq(output)
    end
  end

end
