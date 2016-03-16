unless ENV['TRAVIS'].nil? 
  require 'coveralls'
  Coveralls.wear!
end

# Load the Redmine helper
require File.expand_path(File.dirname(__FILE__) + '/../../../test/test_helper')

self.use_instantiated_fixtures  = true