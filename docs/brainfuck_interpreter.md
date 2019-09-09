# `Brainfuck` Interpreter

> [`Brainfuck`](https://en.wikipedia.org/wiki/Brainfuck) is an esoteric programming language created in 1993 by Urban Müller, and notable for its extreme minimalism.

> The language consists of only eight simple commands and an instruction pointer. While it is fully Turing complete, it is not intended for practical use, but to challenge and amuse programmers. Brainfuck simply requires one to break commands into microscopic steps.

Implement a `Brainfuck` interpreter (as a Ruby class), which takes in a script and executes it. We will include a single test script to help you test correctness, but encourage you to write more tests.

The official [Brainfuck language spec](https://www.muppetlabs.com/~breadbox/bf/) and [Wikipedia article](https://en.wikipedia.org/wiki/Brainfuck) will be helpful.

If you have time, feel free to add creative extensions, such as garbage-collection, or the ability to inspect, debug and step through the execution environment.

The class should be called `Brainfuck`, and it should have a single public method, `interpret!`. The initializer should accept two keyword arguments: `input:` and `output:`, both of type [`IO`](https://ruby-doc.org/core-2.3.1/IO.html). `interpret!` should simply take a `String` containing the instructions of the program to execute.

```ruby
class BrainfuckTester
  def initialize
    @interpreter = Brainfuck.new(input: $stdin, output: $stdout)
  end

  def test!
    script = "++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++."
    @interpreter.interpret!(script) # prints "Hello World!\n"
  end
end
```
