module Beacon
  # Fire an event to be processed by all the watchers. You pass the event name
  # and any arguments you want passed to the event handlers.
  #
  #     Beacon.fire(:some_event, "an argument", 2, "another")
  def self.fire(event, *args)
    events[event].each do |callback|
      callback.call(*args)
    end
  end

  # Register a callback for a given event. Each time you call <tt>fire</tt> then
  # all the callbacks registered for that name will be called in order.
  #
  #     Beacon.watch :some_event do |foo, bar, baz|
  #       # do stuff with foo, bar, and baz
  #     end
  def self.watch(event, &handler)
    events[event] << handler
  end

  def self.events
    @events ||= Hash.new {|h,k| h[k] = [] }
  end
  private_class_method :events
end
