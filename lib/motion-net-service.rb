require "motion-net-service/version"
require 'bubble-wrap'
Dir.glob(File.join(File.dirname(__FILE__), 'motion-net-service/*.rb')).each do |file|
  BW.require file
end
