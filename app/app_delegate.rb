class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @shit = NetService.new("foobar", :port => 8080) do |ns|
      ns.on_did_publish do
        puts "HELLO"
      end
      ns.on_did_not_resolve do |error|
      
      end
    end
    true
  end
end
