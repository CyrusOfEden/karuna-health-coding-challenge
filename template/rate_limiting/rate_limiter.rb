require_relative "./environment"
require_relative "./rate_limiter/limit"
require_relative "./rate_limiter/limited"

class RateLimiter
  attr_accessor :throws, :limits
  attr_reader :monitor

  def initialize(throws:)
    self.throws = throws
    self.limits = {}
  end

  def limit(name, threshold:, period:, &block)
    limit = (
      self.limits[name.to_sym] ||=
        Limit.new(threshold: threshold, period: period))

    result = limit.call(&block)
    if result == :limit_reached && throws
      raise Limited.new("Max limit reached for #{name}")
    end
    result
  end
end
