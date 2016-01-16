require 'spec_helper'

describe WhoAPI::Error do

  let(:error) { WhoAPI::Error.new('1', 'Huge fail') }

  describe '#init' do

    it 'initializes correctly' do
      expect(error.status).to eq '1'
      expect(error.status_desc).to eq 'Huge fail'
    end

  end

  describe '#message' do

    it 'formats the message correctly' do
      expect(error.message).to eq 'Error code: 1 - Huge fail'
    end

  end

end
