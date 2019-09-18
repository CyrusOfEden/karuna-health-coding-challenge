require "test/unit"

require_relative "./environment"
require_relative "./rate_limiter"

class TestRateLimiter < Test::Unit::TestCase
  def setup
    @limiter = RateLimiter.new(throws: true)
    @count = 0
    @period = 5.seconds
    @threshold = 25
  end

  def test_throws
    @threshold.times do |i|
      assert_nothing_raised { run!(:thrower) }
      assert_equal(i + 1, @count)
    end
    assert_raise(RateLimiter::Limited) { run!(:thrower) }
  end

  def test_async
    start = Time.now
    test_throws
    3.times do
      assert_raise(RateLimiter::Limited) { run!(:thrower) }
    end
    assert Time.now < start + @period
  end

  def test_quiet_failure
    @limiter = RateLimiter.new(throws: false)
    @threshold.times do
      assert_nothing_raised { run!(:op) }
    end
    # Return :limit_reached when not throwing
    assert_equal(:limit_reached, run!(:op))
    # The 4th operation should not have executed
    assert_equal(@threshold, @count)
  end

  def test_multiple_limits
    @limiter = RateLimiter.new(throws: false)
    @threshold.times { run!(:one) }
    @threshold.times { run!(:two) }
    3.times do
      assert_equal(:limit_reached, run!(:one))
      assert_equal(:limit_reached, run!(:two))
    end
    assert_equal(@threshold * 2, @count)
  end

  private

  def run!(name)
    @limiter.limit(name, threshold: @threshold, period: @period) do
      @count += 1
    end
  end
end
