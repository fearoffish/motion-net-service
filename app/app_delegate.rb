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
    true
  end
end
