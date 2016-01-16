require 'spec_helper'

describe 'WhoAPI::Client.meta_info' do

  let(:api_key) { ENV['API_KEY'] }
  let(:client) { WhoAPI::Client.new(api_key) }

  let(:output) do
    { title: "WhoAPI - Domain Data Hosting companies Can Use",
      description: "WhoAPI homepage. Domain data that hosting companies, CSOs, webshops and domain investors can use. API, monitoring, reports, bulk and domain overview."}
  end

  it 'receives the meta info for whoapi.com' do
    VCR.use_cassette("meta_info") do
      expect(client.meta_info('whoapi.com')).to eq(output)
    end
  end

end
