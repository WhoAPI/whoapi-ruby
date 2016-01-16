require 'spec_helper'

describe 'WhoAPI::Client.screenshot' do

  let(:api_key) { ENV['API_KEY'] }
  let(:client) { WhoAPI::Client.new(api_key) }

  let(:output) do
    {
      full_size: "http://178.62.104.203/tmp/e0dddcfa02522f28ea79c5126a24882d.jpg",
      thumbnail: "http://178.62.104.203/tmp/e0dddcfa02522f28ea79c5126a24882d_th.jpg",
      expires: "2016-01-16 11:38 GMT",
      size: "1096x4206"
    }
  end

  let(:output_with_fullurl) do
    {
      full_size: "http://46.101.175.48/tmp/a4a53f3d9b5c16d17e31f9f86a44bf75.jpg",
      thumbnail: "http://46.101.175.48/tmp/a4a53f3d9b5c16d17e31f9f86a44bf75_th.jpg",
      expires: "2016-01-16 11:38 GMT",
      size: "1024x5661"
    }
  end

  it 'receives the screenshot' do
    VCR.use_cassette("screenshot") do
      expect(client.screenshot('whoapi.com')).to eq(output)
    end
  end

  context 'with correct fullurl' do

    it 'receives the screenshot for this full url page' do
      VCR.use_cassette("screenshot_with_correct_fullurl") do
        expect(client.screenshot('whoapi.com', 'https://whoapi.com/documentation')).to eq(output_with_fullurl)
      end
    end
  end

end
