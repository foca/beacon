require File.dirname(__FILE__) + '/spec_helper'

class BlockHandler
  def call
    yield
  end
end

describe "Beacon" do
  describe "with a pass-through handler watching :event" do
    before(:each) do
      @args = nil
      Beacon.watch(:event) do |*args|
        @args = args
      end
    end

    it "allows firing an event with no args" do
      Beacon.fire(:event)
      @args.should == []
    end

    it "allows firing an event with 1 arg" do
      Beacon.fire(:event, :test)
      @args.should == [:test]
    end

    it "allows firing an event with args and options" do
      Beacon.fire(:event, :foo, :bar, :baz => :quux)
      @args.should == [:foo, :bar, {:baz => :quux}]
    end
  end

  describe "with a handler which yields the given block" do
    it "allows firing an event with a block" do
      Beacon.watch(:block, BlockHandler.new)
      @value = nil
      Beacon.fire(:block) do
        @value = 1
      end
      @value.should == 1
    end
  end
end
