require 'spec_helper'

describe 'WhoAPI::Client.dns_zone' do

  let(:api_key) { ENV['API_KEY'] }
  let(:client) { WhoAPI::Client.new(api_key) }

  let(:output) do
    {
     ip: "52.32.117.162",
     mx: [
      { priority: "1",  name: "aspmx.l.google.com"},
      { priority: "5",  name: "alt1.aspmx.l.google.com"},
      { priority: "5", name: "alt2.aspmx.l.google.com"},
      { priority: "10", name: "aspmx2.googlemail.com"},
      { priority: "10", name: "aspmx3.googlemail.com"},
      { priority: "10", name: "aspmx4.googlemail.com"},
      { priority: "10",  name: "aspmx5.googlemail.com"}],
     arecord: ["52.32.117.162"],
     soa: {
       nameserver: "ns1.first-ns.de",
       email: "postmaster@robot.first-ns.de",
       serial_number: "2015112000",
       refresh: "14400",
       retry: "1800",
       expire: "604800",
       min_ttl: "86400"},
     nameservers: ["ns1.first-ns.de.", "robotns2.second-ns.de.", "robotns3.second-ns.com."]}
  end

  it 'receives the domain name dns info' do
    VCR.use_cassette("dns_zone") do
      expect(client.dns_zone('whoapi.com')).to eq(output)
    end
  end

end
