class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @service = NetService.new(:name => "foobar", :port => 8080).tap do |ns|
      ns.on_did_publish do
        puts "HELLO"
      end
      ns.on_did_not_resolve do |error|

      end
    end
    @service.publish

    p "SEARCHING NOW."
    @n = NetServiceBrowser.search('_ssh._tcp') do |service, more_coming|
      p "name: #{service.name}, addresses: #{service.addresses.first}"
      p "SERVICE FOUND: #{service.hostName}"
      p "MORE COMING: #{more_coming}"
    end
    true
  end
end
