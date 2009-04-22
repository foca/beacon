# The masters are the objects that will fire events. You do that
# by including Master into your class and then calling inside your 
# methods (both class and instance methods) <tt>notify</tt> with
# the event name and whatever arguments you want to pass to it.
module Master
  class << self
    # Collection of servants registered to listen to events
    attr_reader :servants

    def included(servant) #:nodoc:
      @servants ||= []
      servant.extend self
    end

    # Pass a list of Servant objects that will get added as 
    # listeners to your objects
    def add_servants(*servants)
      @servants += servants
      self
    end
    alias << add_servants
  end

  # Fire an event. You can pass a number of arguments to it. The
  # listener will receive the instance that fired the event and
  # <em>then</em> the arguments you pass. So for example:
  #
  #     class A; include Master; end
  #     a = A.new
  #     a.notify(:cuacking, "cuack")
  #
  # Will fire :cuacking on all registered servants, passing
  # <tt>a</tt> and <tt>cuack</tt>
  def notify(event, *args)
    Master.servants.each do |servant|
      servant.update(event, self, *args)
    end
  end
end

# Servants are event listeners (observers, if you please)
# You define a Servant by creating a class or module and
# including <tt>Servant</tt>.
#
# This allows you to call <tt>observe</tt> on the class
# to define an observer, passing the event name and a
# handler.
module Servant
  def self.included(base) #:nodoc:
    base.extend ClassMethods
  end

  module ClassMethods
    # Add a new event handler. For example
    #
    #     class LoggerPlugin
    #       include Servant
    #
    #       observe :foo do |obj|
    #         logger.info obj.inspect
    #       end
    #
    #       def self.logger
    #         @logger ||= Logger.new(STDOUT)
    #       end
    #     end
    #
    # The first argument to the handler is always the object
    # that fired it, and the rest of the arguments are those
    # passed to <tt>notify</tt> on the Master.
    def observe(event, &block)
      events[event] << block
    end

    def update(event, *args) #:nodoc:
      events[event].detect do |callback|
        !callback.call(*args)
      end
    end

    private

    def events
      @events ||= Hash.new {|h,k| h[k] = [] }
    end
  end
end
