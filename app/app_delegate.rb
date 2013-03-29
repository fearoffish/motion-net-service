class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @service = NetService.new("foobar", :port => 8080).tap do |ns|
      ns.on_did_publish do
        puts "HELLO"
      end
      ns.on_did_not_resolve do |error|

      end
    end
    @service.publish

    p "SEARCHING NOW."
    @n = NetServiceBrowser.search('_ssh._tcp') do |service, more_coming|
      s = service.instance_variable_get(:@net_service)
      p "name: #{s.name}, addresses: #{s.addresses.first}"
      p "SERVICE FOUND: #{s.hostName}"
      p "MORE COMING: #{more_coming}"
    end
    true
  end
end
