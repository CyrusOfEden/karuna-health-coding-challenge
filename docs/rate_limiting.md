# Rate Limiting

Design a class that allows for rate-limiting of arbitrary code blocks. Initially, assume there is only one thread using an instance of the class at a time, and that any state can be stored internally and locally. You are free to choose any sane rate-limiting algorithm. Please include a test file (or modify the [existing one](../template/rate_limiting/test_rate_limiter.rb)) to demonstrate the correctness of your class. Do not worry about writing particularly performant code; the focus should be on correctness and code quality.

If you have time, feel free to add creative extensions, such as thread-safety, per-instance default options, shared remote state in a database, alternative rate-limiting schemes, or improving runtime/memory performance. This is strictly optional.

The class should be called `RateLimiter`, and it should have a single public method, `limit`. The initializer should accept a hash of options that includes `throws`. The `limit` method should take a `name`, `threshold`, and `period`. This is demonstrated below.

If `throws` is `true`, the block should raise a `RateLimiter::Limited` error when the number of calls exceeds the `threshold` for a given `period`. If `throws` is `false`, the block should simply not execute, instead of throwing an error.

You may assume that there is a maximum to the length of any `period` of `10.minutes`. Please document this or any other assumptions clearly.

```ruby
class RateLimitTester
  def initialize
    @limiter = RateLimiter.new(throws: true)
  end

  def expensive_foo!
    @limiter.limit(:expensive_foo, threshold: 3, period: 1.minute) do
      sleep 1
    end
  end
end

tester = RateLimitTester.new
3.times { tester.expensive_foo! }
tester.expensive_foo! # should raise RateLimiter::Limited
```
