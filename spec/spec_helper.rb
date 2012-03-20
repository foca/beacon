require "beacon"

RSpec.configure do |config|
  config.before(:each) do
    Beacon.instance_variable_set(:@events, nil)
  end
end
