require 'spec_helper'

describe 'WhoAPI::Client.hostname_info' do

  let(:api_key) { ENV['API_KEY'] }
  let(:client) { WhoAPI::Client.new(api_key) }

  let(:output) do
    {
      ip: "52.32.117.162",
      basedomain: "ec2-52-32-117-162.us-west-2.compute.amazonaws.com",
      hostname: "ec2-52-32-117-162.us-west-2.compute.amazonaws.com"
    }
  end

  let(:output_with_wrong_ip) do
    {
      ip: nil,
      basedomain: nil,
      hostname: nil
    }
  end

  it 'receives the hostname info' do
    VCR.use_cassette("hostname") do
      expect(client.hostname_info('whoapi.com')).to eq(output)
    end
  end

  context 'with correct ip' do

    it 'receives the same hostname info' do
      VCR.use_cassette("hostname_with_correct_ip") do
        expect(client.hostname_info('whoapi.com', '52.32.117.162')).to eq(output)
      end
    end
  end

  context 'with wrong ip' do

    it 'receives nil values' do
      VCR.use_cassette("hostname_with_wrong_ip") do
        expect(client.hostname_info('whoapi.com', '1.2.3.4')).to eq(output_with_wrong_ip)
      end
    end
  end

end
