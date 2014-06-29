$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "monitor_it/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "monitor_it"
  s.version     = MonitorIt::VERSION
  s.authors     = ["Zohaib Sarwar"]
  s.email       = ["zohaib.sarwar@confiz.com"]
  s.homepage    = ""
  s.summary     = "MonitorIt is a gem that can be help to monitor request performance."
  s.description = "MonitorIt a client/agent "

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.17"
  s.add_dependency "httparty"
  s.add_dependency "jquery-rails"
end
