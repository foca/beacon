require File.dirname(__FILE__) + '/../lib/beacon'

Spec::Runner.configure do |config|
  config.before(:each) do
    Beacon.instance_variable_set(:@events, nil)
  end
end
