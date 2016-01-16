require 'spec_helper'

describe 'WhoAPI::Client.social_availability' do

  let(:api_key) { ENV['API_KEY'] }
  let(:client) { WhoAPI::Client.new(api_key) }

  let(:output) do
    {
      facebook_taken: "0",
      linkedin_taken: "1",
      twitter_taken: "0",
      tumblr_taken: "1",
      appstore_taken: "0",
      appstore_link: "-1"
   }
  end

  it 'receives the social info' do
    VCR.use_cassette("social") do
      expect(client.social_availability('whoapi.com')).to eq(output)
    end
  end

end
