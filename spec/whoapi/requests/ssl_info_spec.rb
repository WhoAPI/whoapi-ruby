require 'spec_helper'

describe 'WhoAPI::Client.ssl_info' do

  let(:api_key) { ENV['API_KEY'] }
  let(:client) { WhoAPI::Client.new(api_key) }

  let(:output) do
    {
      certondomain: true,
      category: "Private Organization",
      organization: "WhoAPI Inc.",
      street: "444 Castro street",
      city: "Mountain View",
      state: "California",
      postalcode: "94041",
      country: "US",
      other: ["US", "Delaware"],
      issuer: "COMODO CA Limited",
      date_issued: "2016-01-11 00:00:00",
      date_expires: "2017-03-11 23:59:59"
    }
  end

  it 'receives the certificate info' do
    VCR.use_cassette("ssl") do
      expect(client.ssl_info('whoapi.com')).to eq(output)
    end
  end

end
