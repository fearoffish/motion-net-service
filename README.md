# NetService

NetService is a simple wrapper around NSNetService. It publishes and consumes services over Bonjour.

## Installation

Command Line:

```bash
gem install motion-net-service
```

Bundler:

```ruby
gem 'motion-net-service'
```

## Usage

Publishing a NetService (Bonjour) service:

```ruby
@service = NetService.new(name: "amazaballs", port: 4321).tap do |ns|
  ns.on_did_publish do
    puts "I published a service"
  end
  ns.on_did_not_resolve do |error|
    puts "Oh crap, I got an error: #{error}"
  end
end

@service.publish
```

Consuming a service

```ruby
@n = NetServiceBrowser.search('_ssh._tcp') do |service, more_coming|
  p "name: #{service.name}
  p "service url: #{service.hostName}:#{service.port}"
  p "More coming?: #{more_coming}"
end
```

## License

MIT, check the LICENSE file.
