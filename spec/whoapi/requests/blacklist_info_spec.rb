require 'spec_helper'

describe 'WhoAPI::Client.blacklist_info' do

  let(:api_key) { ENV['API_KEY'] }
  let(:client) { WhoAPI::Client.new(api_key) }

  let(:output) do
    {
      ip: "52.32.117.162",
      blacklisted: "0",
      blacklists: [ {
         tracker: "surbl.org",
         blacklisted: "0"
     },
      {
         tracker: "barracudacentral.org",
         blacklisted: "0"
     },
      {
         tracker: "sorbs.net",
         blacklisted: "0"
     },
      {
         tracker: "spamhaus.org",
         blacklisted: "0"
     } ]
   }
  end

  it 'receives that the domain is not blacklisted' do
    VCR.use_cassette("blacklist") do
      expect(client.blacklist_info('whoapi.com')).to eq(output)
    end
  end

end
