class NetService
  def initialize(name, options = {})
    default_options = {
      domain: "",
      type: "_http._tcp.",
    }
    options.merge!(default_options)
    
    @publisher = NSNetService.alloc.initWithDomain options[:domain], type:options[:type], name:name, port:options[:port]
    @publisher.setDelegate(self)
    
    if block_given?
      yield self
      publish
    end
  end
  
  def publish
    @publisher.publish
  end

  [
    :on_will_publish, :on_did_not_publish, :on_did_publish, :on_will_resolve, :on_did_not_resolve,
    :on_did_resolve_address, :on_did_update_txt_record_data, :on_did_stop
  ].each do |callback|
    define_method callback do |&block|
      instance_variable_set("@#{callback}", block)
    end
  end
  
protected
  def netServiceWillPublish(sender)
    @on_publish.call if @on_publish
  end
  
  def netService(sender, didNotPublish:errors)
    @on_did_not_publish.call(errors) if @on_did_not_publish
  end
  
  def netServiceDidPublish(sender)
    @on_did_publish.call if @on_did_publish
  end
  
  def netServiceWillResolve(sender)
    @on_will_resolve.call if @on_will_resolve
  end
  
  def netService(sender, didNotResolve:errors)
    @on_did_not_resolve.call(errors) if @on_did_not_resolve
  end
  
  def netServiceDidResolveAddress(sender)
    @on_did_resolve_address.call if @on_did_resolve_address
  end
  
  def netService(sender, didUpdateTXTRecordData:data)
    @on_did_update_txt_record_data.call(data) if @on_did_update_txt_record_data
  end
  
  def netServiceDidStop(sender)
    @on_did_stop.call if @on_did_stop
  end
end

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
