require File.dirname(__FILE__) + '/spec_helper'

class Handler
  def initialize
    @value = nil
  end
  attr_reader :value

  def call
    @value = 1
  end
end

describe "Beacon" do
  it "allows watching an event with a block" do
    value = nil
    Beacon.watch(:event) do
      value = 1
    end
    Beacon.fire(:event)
    value.should == 1
  end

  it "allows watching an event with an object" do
    handler = Handler.new
    Beacon.watch(:event, handler)
    Beacon.fire(:event)
    handler.value.should == 1
  end

  it "disallows watching an event without either a block or an object" do
    lambda { Beacon.watch(:event) }.
      should raise_error(ArgumentError, "You must provide a handler")
  end

  it "disallows watching an event both a block and an object" do
    lambda {
      Beacon.watch(:event, Handler.new) do
        nil
      end
    }.should raise_error(ArgumentError, "You cannot register a handler with both a block and an object")
  end
end
