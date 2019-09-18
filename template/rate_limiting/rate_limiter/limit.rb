class RateLimiter
  class Limit
    attr_reader :threshold, :period, :calls

    def initialize(threshold:, period:)
      @threshold = threshold
      @period = period
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
      if reset_at && reset_at <= Time.now
        reset!
      elsif calls >= threshold
        return :limit_reached
      end
      result = block.call

      if calls.zero?
        @first_call_at = Time.now 
      end
      @calls += 1
      result
    end

    def ==(other_limit)
      threshold == other_limit.threshold && period == other_limit.period
    end
  end
end
