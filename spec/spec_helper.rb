$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'webmock/rspec'
require 'vcr'
require 'whoapi'

ENV['API_KEY'] = 'fake'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
end
