require 'spec_helper'

describe 'WhoAPI::Client.domain_availability' do

  let(:api_key) { ENV['API_KEY'] }
  let(:client) { WhoAPI::Client.new(api_key) }

  let(:output) { { taken: 1 } }

  it 'gets the domain availability back' do
    VCR.use_cassette("domain_availability") do
      expect(client.domain_taken?('whoapi.com')).to eq(output)
    end
  end

end
