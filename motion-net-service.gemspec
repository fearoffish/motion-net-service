# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-net-service/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "motion-net-service"
  s.version     = MotionNetService::VERSION
  s.authors     = ["Jamie van Dyke", "Thomas Kadauke"]
  s.email       = ["jamie@fearoffish.com", "thomas.kadauke@googlemail.com"]
  s.homepage    = "https://github.com/fearoffish/motion-net-service"
  s.summary     = "Wrapper around NSNetService for RubyMotion"
  s.description = "Wrapper around NSNetService for RubyMotion."

  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency 'bubble-wrap'
  s.add_development_dependency 'rake'
end
