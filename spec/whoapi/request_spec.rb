require 'spec_helper'

describe WhoAPI::Request do

  let(:api_key) { 'fake' }
  let(:request) { WhoAPI::Request.new('taken', { apikey: api_key, domain: 'whoapi.com' }) }

  it 'has the correct base url' do
    expect(WhoAPI::Request::BASE_URL).to eq 'api.whoapi.com'
  end

  describe '#build_query' do

    it 'builds the query' do
      expect(request.send(:build_query)).to eq("?r=taken&apikey=#{api_key}&domain=whoapi.com")
    end

  end

  describe '#check_response' do

    context 'when 200' do

      let(:resp) { OpenStruct.new({ code: 200 }) }

      context 'when status is 0 (success)' do

        let(:json) { { 'status' => '0' } }

        it 'does nothing' do
          expect(request.send(:check_response, resp, json)).to eq(nil)
        end

      end

      context 'when status is different from 0 (failure)' do

        let(:json) { { 'status' => '1', 'status_desc' => 'Invalid characters in domain name.' } }

        it 'raises a WhoAPI error' do
          expect {
            request.send(:check_response, resp, json)
          }.to raise_error WhoAPI::Error
        end

      end

    end

    context 'when different from 200' do

      let(:resp) { OpenStruct.new({ code: 500 }) }

      it 'raises a WhoAPI error with HTTP Code' do
        expect {
          request.send(:check_response, resp, {})
        }.to raise_error WhoAPI::Error
      end

    end

  end

  describe '#run' do

    context 'with valid parameters' do

      before do
        stub_request(:get, "http://api.whoapi.com/?apikey=fake&domain=whoapi.com&r=taken").
           to_return(:status => 200, :body => "{ \"status\" : \"0\", \"taken\" : \"1\"}", :headers => {})
      end

      it 'returns the symbolized hash' do
        expect(request.run).to eq({ taken: '1' })
      end

    end

    context 'with invalid parameters' do

      before do
        stub_request(:get, "http://api.whoapi.com/?apikey=fake&domain=who%20api.com&r=taken").
           to_return(:status => 200, :body => "{ \"status\" : \"1\", \"status_desc\" : \"Invalid characters in domain name.\"}", :headers => {})
      end

      let(:request) { WhoAPI::Request.new('taken', { apikey: api_key, domain: 'who api.com' }) }

      it 'gets a X error back' do
        expect { request.run }.to raise_error(WhoAPI::Error)
      end

    end

  end

end
