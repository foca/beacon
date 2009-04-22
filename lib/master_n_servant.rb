module Master
  class << self
    attr_reader :servants

    def included(servant)
      @servants ||= []
      servant.extend self
    end

    def add_servant(*servants)
      @servants += servants
    end
    alias << add_servant
  end

  def notify(event, *args)
    Master.servants.each do |servant|
      servant.update(event, self, *args)
    end
  end
end

module Servant
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def observe(event, &block)
      events[event] << block
    end

    def update(event, *args)
      events[event].each do |callback|
        callback.call(*args)
      end
    end

    def events
      @events ||= Hash.new {|h,k| h[k] = [] }
    end
  end
end
