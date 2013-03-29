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

    @browser = NetServiceBrowser.new('_ssh._tcp')
    p "SEARCHING NOW."
    @browser.search do |service, more_coming|
      s = service.instance_variable_get(:@net_service)
      p "name: #{s.name}, addresses: #{s.addresses}"
      p "SERVICE FOUND: #{s.hostName}"
      p "MORE COMING: #{more_coming}"
    end
    true
  end
end
