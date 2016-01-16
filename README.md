# Whoapi

[WhoAPI](https://whoapi.com) offers a range of services allowing the querying of domain name data. Track everything and never miss a renewal anymore (domain name, certificates, blacklists, etc).

This gem wraps all the calls to all the endpoints with easy-to-use Ruby methods.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'whoapi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install whoapi

## Usage

Once you've installed the gem, you're ready to use it - there is no configuration.

Here's a quick example on how to use this gem to do a domain availability check.

```ruby
whoapi = WhoAPI::Client.new(YOUR_API_KEY)
whoapi.domain_availability('whoapi.com')
```

This method will return the following hash:

```json
{ taken: 1 }
```

That means, unfortunately, that `whoapi.com` is already registered!

See below for all the other available requests.

### API Key

You can get an API Key by signing up at [whoapi.com](https://whoapi.com/user/signup). The API Key needs to be passed to the `WhoAPI::Client` at creation.

### Public API

All the following methods are accessible on a `WhoAPI::Client` instance.

#### List of available methods

1. Domain Availability: `#domain_availability(domain_name)`
2. Email Blacklisting: `#blacklist_info(domain_name)`
3. Whois: `#whois_info(domain_name)`
4. SSL: `#ssl_info(domain_name)`
5. Social: `#social_availability(domain_name)`
6. Ranks: `#ranking_info(domain_name, full_url = nil)`
7. Meta Data: `#meta_info(domain_name)`
8. DNS Zone: `#dns_zone(domain_name)`
9. Screenshot: `#screenshot(domain_name, full_url = nil)`
10. Hostname: `#hostname_info(domain_name, ip = nil)`
11. Geo Location: `#geo_data(domain_name, ip = nil)`

#### 1. Domain Availability

Check domain availability for registration.

Method: `#domain_availability(domain_name)`

Arguments
- `domain_name` (string, mandatory): full domain name, including the tld e.g. whoapi.com

Example:

```ruby
WhoAPI::Client.new(YOUR_API_KEY).domain_availability('whoapi.com')
```
Output

```ruby
{ taken: 1 }
```

Read more about this endpoint [in the WhoAPI documentation](https://whoapi.com/index.php/documentation/api/domain-availability).

#### 2. Email Blacklisting

Status of domain name and it's IP address on all the popular email blacklists.

Method: `#blacklist_info(domain_name)`

Arguments
- `domain_name` (string, mandatory): full domain name, including the tld e.g. whoapi.com

Example:

```ruby
WhoAPI::Client.new(YOUR_API_KEY).blacklist_info('whoapi.com')
```
Output

```ruby
{
  ip: "52.32.117.162",
  blacklisted: "0",
  blacklists: [ {
     tracker: "surbl.org",
     blacklisted: "0"
 },
  {
     tracker: "barracudacentral.org",
     blacklisted: "0"
 },
  {
     tracker: "sorbs.net",
     blacklisted: "0"
 },
  {
     tracker: "spamhaus.org",
     blacklisted: "0"
 } ]
}
```

Read more about this endpoint [in the WhoAPI documentation](https://whoapi.com/index.php/documentation/api/blacklist).

#### 3. Whois

Structured and parsed raw WHOIS data such as domain registration & expiry date, owner contact details, nameservers, registrar information etc.

Method: `#whois_info(domain_name)`

Arguments
- `domain_name` (string, mandatory): full domain name, including the tld e.g. whoapi.com

Example:

```ruby
WhoAPI::Client.new(YOUR_API_KEY).whois_info('whoapi.com')
```
Partial Output

```ruby
{
  whois_server: "whois.publicdomainregistry.com",
  limit_hit: false,
  registered: true,
  premium: false,
  domain_status: ["clienttransferprohibited http://www.icann.org/epp#clienttransferprohibited"],
  date_created: "2011-02-14 15:31:26",
  date_updated: "2015-11-20 13:01:03",
  date_expires: "2021-02-14 00:00:00",
  ...
}
```

Read more about this endpoint [in the WhoAPI documentation](https://whoapi.com/index.php/documentation/api/whois).

#### 4. SSL

Detailed domain certificate information.

Method: `#ssl_info(domain_name)`

Arguments
- `domain_name` (string, mandatory): full domain name, including the tld e.g. whoapi.com

Example:

```ruby
WhoAPI::Client.new(YOUR_API_KEY).ssl_info('whoapi.com')
```
Output

```ruby
{
  certondomain: true,
  category: "Private Organization",
  organization: "WhoAPI Inc.",
  street: "444 Castro street",
  city: "Mountain View",
  state: "California",
  postalcode: "94041",
  country: "US",
  other: ["US", "Delaware"],
  issuer: "COMODO CA Limited",
  date_issued: "2016-01-11 00:00:00",
  date_expires: "2017-03-11 23:59:59"
}
```

Read more about this endpoint [in the WhoAPI documentation](https://whoapi.com/index.php/documentation/api/ssl).

#### 5. Social

Domain name availability status on popular social networks.

Method: `#social_availability(domain_name)`

Arguments
- `domain_name` (string, mandatory): full domain name, including the tld e.g. whoapi.com

Example:

```ruby
WhoAPI::Client.new(YOUR_API_KEY).social_availability('whoapi.com')
```
Output

```ruby
{
  facebook_taken: "0",
  linkedin_taken: "1",
  twitter_taken: "0",
  tumblr_taken: "1",
  appstore_taken: "0",
  appstore_link: "-1"
}
```

Read more about this endpoint [in the WhoAPI documentation](https://whoapi.com/index.php/documentation/api/social).

#### 6. Ranks

Domain rank on popular systems like Google PageRank and Alexa.

Method: `#ranking_info(domain_name, full_url = nil)`

Arguments
- `domain_name` (string, mandatory): full domain name, including the tld e.g. whoapi.com
- `full_url` (string, optional): optional field if you want to get specific url rank. This parameter will override the `domain_name` if provided.

Example:

```ruby
WhoAPI::Client.new(YOUR_API_KEY).ranking_info('whoapi.com')
```
Output

```ruby
{
  pr: "4",
  alexa_reach: "310078",
  alexa_popularity: "229302",
  alexa_linksin: "-1",
  email: nil,
  title: nil
}
```

Read more about this endpoint [in the WhoAPI documentation](https://whoapi.com/index.php/documentation/api/ranks).

#### 7. Meta Data

Domain content meta tags: title&description.

Method: `#meta_info(domain_name)`

Arguments
- `domain_name` (string, mandatory): full domain name, including the tld e.g. whoapi.com

Example:

```ruby
WhoAPI::Client.new(YOUR_API_KEY).meta_info('whoapi.com')
```
Output

```ruby
{
  title: "WhoAPI - Domain Data Hosting companies Can Use",
  description: "WhoAPI homepage. Domain data that hosting companies, CSOs, webshops and domain investors can use. API, monitoring, reports, bulk and domain overview."
}
```

Read more about this endpoint [in the WhoAPI documentation](https://whoapi.com/index.php/documentation/api/meta).

#### 8. DNS Zone

Complete DNS Zone record in a structured hash.

Method: `#dns_zone(domain_name)`

Arguments
- `domain_name` (string, mandatory): full domain name, including the tld e.g. whoapi.com

Example:

```ruby
WhoAPI::Client.new(YOUR_API_KEY).dns_zone('whoapi.com')
```
Output

```ruby
{
 ip: "52.32.117.162",
 mx: [
  { priority: "1",  name: "aspmx.l.google.com"},
  { priority: "5",  name: "alt1.aspmx.l.google.com"},
  { priority: "5",  name: "alt2.aspmx.l.google.com"},
  { priority: "10", name: "aspmx2.googlemail.com"},
  { priority: "10", name: "aspmx3.googlemail.com"},
  { priority: "10", name: "aspmx4.googlemail.com"},
  { priority: "10", name: "aspmx5.googlemail.com"}],
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
```

Read more about this endpoint [in the WhoAPI documentation](https://whoapi.com/index.php/documentation/api/dns-zone).

#### 9. Screenshot

This method generates website screenshots in actual full vertical size and a website thumbnail.

Method: `#screenshot(domain_name, full_url = nil)`

Arguments
- `domain_name` (string, mandatory): full domain name, including the tld e.g. whoapi.com
- `full_url` (string, optional): optional field if you want to get specific url rank. This parameter will override the `domain_name` if provided.

Example:

```ruby
WhoAPI::Client.new(YOUR_API_KEY).screenshot('whoapi.com')
```
Output

```ruby
{
  full_size: "http://178.62.104.203/tmp/e0dddcfa02522f28ea79c5126a24882d.jpg",
  thumbnail: "http://178.62.104.203/tmp/e0dddcfa02522f28ea79c5126a24882d_th.jpg",
  expires: "2016-01-16 11:38 GMT",
  size: "1096x4206"
}
```

Read more about this endpoint [in the WhoAPI documentation](https://whoapi.com/index.php/documentation/api/screenshot).

#### 10. Hostname

Get domain/server hostname.

Method: `#hostname_info(domain_name, ip = nil)`

Arguments
- `domain_name` (string, mandatory): full domain name, including the tld e.g. whoapi.com
- `ip` (string, optional): Specify direct IP to check; we usually resolve IP from domain name. This parameter overrides domain name if provided.

Example:

```ruby
WhoAPI::Client.new(YOUR_API_KEY).hostname_info('whoapi.com')
```
Output

```ruby
{
  ip: "52.32.117.162",
  basedomain: "ec2-52-32-117-162.us-west-2.compute.amazonaws.com",
  hostname: "ec2-52-32-117-162.us-west-2.compute.amazonaws.com"
}
```

Read more about this endpoint [in the WhoAPI documentation](https://whoapi.com/index.php/documentation/api/hostname).

#### 11. Geo Location

Domain or IP geolocation.

Method: `#geo_data(domain_name, ip = nil)`

Arguments
- `domain_name` (string, mandatory): full domain name, including the tld e.g. whoapi.com
- `ip` (string, optional): Specify direct IP to check; we usually resolve IP from domain name. This parameter overrides domain name if provided.

Example:

```ruby
WhoAPI::Client.new(YOUR_API_KEY).geo_data('google.com')
```
Output

```ruby
{
  ip: "173.194.116.136",
  geo_cc: "us",
  geo_country: "United States",
  geo_city: nil,
  geo_latitude: nil,
  geo_longitude: nil
}
```

Read more about this endpoint [in the WhoAPI documentation](https://whoapi.com/index.php/documentation/api/geo-location).

### Exceptions

Exceptions will be raised with a `WhoAPI::Error` in the format `Error code: x - xxxxx`.

#### HTTP Error

If something goes wrong with the HTTP request being made to access WhoAPI API, a `WhoAPI::Error` exception will be raised with the HTTP status code and the body of the response.

Example: `Error code: HTTP 500 - Interval Server Error`

#### API Error

If the API sends back a known error, a `WhoAPI::Error` will be raised with the API error code and the corresponding error message.

Example: `Error code: 12 - Invalid API account.`

The list of all errors, with their status code and description, can be found [here](https://whoapi.com/documentation).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/whoapi/whoapi-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
