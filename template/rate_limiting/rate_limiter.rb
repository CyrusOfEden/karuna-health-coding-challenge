require_relative "./environment"
require_relative "./rate_limiter/limit"
require_relative "./rate_limiter/limited"
require_relative "./rate_limiter/monitor"

class RateLimiter
  attr_accessor :throws, :limits
  attr_reader :monitor

  def initialize(throws:, monitor: Monitor.new)
    self.throws = throws
    self.limits = {}
    @monitor = monitor
  end

  def limit(name, threshold:, period:, &block)
    limit = (
      self.limits[name.to_sym] ||=
        Limit.new(threshold: threshold, period: period, monitor: @monitor))

    result = limit.call(&block)
    if result == :limit_reached && throws
      raise Limited.new("Max limit reached for #{name}")
    end
    result
  end
end
