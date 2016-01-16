require 'spec_helper'

describe WhoAPI::Client do

  let(:api_key) { 'fake' }
  let(:client) { WhoAPI::Client.new(api_key) }

  describe '#build_params' do

    context 'with value' do

      it 'builds the parameters hash' do
        output = client.send(:build_params, 'whoapi.com', :ip, '1.2.3.4')
        expect(output).to eq({ domain: 'whoapi.com', ip: '1.2.3.4' })
      end

    end

    context 'without value' do

      it 'builds the parameters hash' do
        output = client.send(:build_params, 'whoapi.com', :ip, nil)
        expect(output).to eq({ domain: 'whoapi.com' })
      end

    end

  end

end
