require 'spec_helper'

describe 'WhoAPI::Client.whois_info' do

  let(:api_key) { ENV['API_KEY'] }
  let(:client) { WhoAPI::Client.new(api_key) }

  let(:output) do
    {
      whois_server: "whois.publicdomainregistry.com",
      limit_hit: false,
      registered: true,
      premium: false,
      domain_status: ["clienttransferprohibited http://www.icann.org/epp#clienttransferprohibited"],
      date_created: "2011-02-14 15:31:26",
      date_updated: "2015-11-20 13:01:03",
      date_expires: "2021-02-14 00:00:00",
      contacts: [
        {
          type: "registrar",
          name: "",
          organization: "PDR Ltd. d/b/a PublicDomainRegistry.com",
          full_address: "",
          street: "",
          city: "",
          zipcode: "",
          state: "",
          country: "",
          phone: "+1-2013775952",
          fax: "",
          email: "abuse-contact@publicdomainregistry.com"
        },
        {
          type: "registrant",
          name: "Goran Duskic",
          organization: "WhoAPI Inc.",
          full_address: "Goran Duskic\nWhoAPI Inc.\n444 Castro Street   \n94041 Mountain View\nCalifornia\nUS",
          street: "444 Castro Street",
          city: "Mountain View",
          zipcode: "94041",
          state: "California",
          country: "US",
          phone: "+1.6506918352",
          fax: "",
          email: "contact@whoapi.com"
        },
      {
        type: "admin",
        name: "Goran Duskic",
        organization: "WhoAPI Inc.",
        full_address: "Goran Duskic\nWhoAPI Inc.\n444 Castro Street  \n94041 Mountain View\nCalifornia\nUS",
        street: "444 Castro Street",
        city: "Mountain View",
        zipcode: "94041",
        state: "California",
        country: "US",
        phone: "+1.6506918352",
        fax: "",
        email: "contact@whoapi.com"
      },
      {
        type: "tech",
        name: "Goran Duskic",
        organization: "WhoAPI Inc.",
        full_address: "Goran Duskic\nWhoAPI Inc.\n444 Castro Street  \n94041 Mountain View\nCalifornia\nUS",
        street: "444 Castro Street",
        city: "Mountain View",
        zipcode: "94041",
        state: "California",
        country: "US",
        phone: "+1.6506918352",
        fax: "",
        email: "contact@whoapi.com"
      }],
      nameservers: ["ns1.first-ns.de", "robotns2.second-ns.de", "robotns3.second-ns.com"],
      disclaimer: "The data in this whois database is provided to you for information purposes \nonly, that is, to assist you in obtaining information about or related to a \ndomain name registration record. We make this information available \"as is\",\nand do not guarantee its accuracy. By submitting a whois query, you agree \nthat you will use this data only for lawful purposes and that, under no \ncircumstances will you use this data to: \n(1) enable high volume, automated, electronic processes that stress or load \nthis whois database system providing you this information; or \n(2) allow, enable, or otherwise support the transmission of mass unsolicited, \ncommercial advertising or solicitations via direct mail, electronic mail, or \nby telephone. \nThe compilation, repackaging, dissemination or other use of this data is \nexpressly prohibited without prior written consent from us. The Registrar of \nrecord is PDR Ltd. d/b/a PublicDomainRegistry.com. \nWe reserve the right to modify these terms at any time. \nBy submitting this query, you agree to abide by these terms.",
      emails: ["contact@whoapi.com", "abuse-contact@publicdomainregistry.com"]
    }
  end

  it 'receives the whois info' do
    VCR.use_cassette("whois") do
      result = client.whois_info('whoapi.com')
      result.delete(:whois_raw)
      result.delete(:whois_raw_parent)
      expect(result).to eq(output)
    end
  end

end
