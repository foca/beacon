require "spec_helper"

describe Beacon do
  class Observable < Struct.new(:int)
    include Beacon
  end

  let(:observable_1) { Observable.new(1) }
  let(:observable_2) { Observable.new(1) }

  before do
    observable_1.watch(:inc) { observable_1.int += 1 }
  end

  it "can listen to events on instances of objects where you mix in Beacon" do
    expect { observable_1.trigger(:inc) }.to change { observable_1.int }.by(1)
  end

  it "will ignore events fired on other instances" do
    expect { observable_2.trigger(:inc) }.to_not change { observable_1.int }.by(1)
    expect { Beacon.trigger(:inc) }.to_not change { observable_1.int }.by(1)
  end
end
