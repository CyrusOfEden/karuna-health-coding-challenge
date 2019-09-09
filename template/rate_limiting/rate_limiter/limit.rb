class RateLimiter
  class Limit
    attr_reader :threshold, :period, :monitor, :calls

    def initialize(threshold:, period:, monitor:)
      @threshold = threshold
      @period = period
      @monitor = monitor
      @calls = 0
    end

    def reset_at
      return if @first_call_at.nil?
      @first_call_at + period
    end

    def reset!
      @first_call_at = nil
      @calls = 0
    end

    def call(&block)
      return :limit_reached if calls >= threshold
      result = block.call

      if calls.zero?
        @first_call_at = Time.now
        monitor.enqueue(limit: self)
      end
      @calls += 1
      result
    end

    def ==(other_limit)
      threshold == other_limit.threshold && period == other_limit.period
    end
  end
end
