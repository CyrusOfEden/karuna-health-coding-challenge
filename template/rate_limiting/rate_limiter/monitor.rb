require "pqueue"

class RateLimiter
  class Monitor
    def initialize(poll_interval: 5.seconds)
      @poll_interval = poll_interval
      @queue = PQueue.new { |limit_1, limit_2| limit_1.reset_at < limit_2.reset_at }
      @thread = Thread.new do
        if @queue.top && @queue.top.reset_at <= Time.now
          limit = @queue.pop
          limit.reset!
        end
        sleep @poll_interval
      end
    end

    def enqueue(limit:)
      @queue << limit
    end
  end
end
