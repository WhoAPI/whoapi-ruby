require 'spec_helper'

describe 'WhoAPI::Client.ranking_info' do

  let(:api_key) { ENV['API_KEY'] }
  let(:client) { WhoAPI::Client.new(api_key) }

  let(:output) do
    {
      pr: "4",
      alexa_reach: "310078",
      alexa_popularity: "229302",
      alexa_linksin: "-1",
      email: nil,
      title: nil
    }
  end

  let(:output_with_fullurl) do
    {
      pr: "1",
      alexa_reach: "310078",
      alexa_popularity: "229302",
      alexa_linksin: "-1",
      email: nil,
      title: nil
    }
  end

  it 'receives the ranking info' do
    VCR.use_cassette("ranking") do
      expect(client.ranking_info('whoapi.com')).to eq(output)
    end
  end

  context 'with correct fullurl' do

    it 'receives the ranking info' do
      VCR.use_cassette("ranking_with_correct_fullurl") do
        expect(client.ranking_info('whoapi.com', 'https://whoapi.com/documentation')).to eq(output_with_fullurl)
      end
    end
  end

end
