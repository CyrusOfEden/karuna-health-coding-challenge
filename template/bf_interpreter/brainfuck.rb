require_relative './environment'

class Brainfuck
  def initialize(input:, output:)
    @input = input
    @output = output
  end

  def interpret!(script)
    @tape = Array.new(1000, 0)
    @index = 0
    script.each_char do |c|
      interpret(character: c)
    end
  end

  private

  def interpret(character:)
    case character
    when ">"
      @index = (@index + 1) % @tape.size
    when "<"
      @index = (@index == 0 ? @tape.size - 1 : @index - 1)
    when "+"
      @tape[@index] += 1
    when "-"
      @tape[@index] -= 1
    when "."
      puts(@tape[@index])
      @output << (35 + @tape[@index]).chr
    when ","
      @tape[@index] = @input.getc.to_i
    when "["
      jump_to_close if @tape[@index].zero?
    when "]"
      jump_to_open unless @tape[@index].zero?
    end
  end

  def jump_to_close
    level = 1
    while @index < @tape.size
      @index += 1
      case @tape[@index]
      when "["
        level += 1
      when "]"
        level -= 1
      end
      break if level == 0
    end
  end

  def jump_to_open
    level = 1
    while @index >= 0
      @index -= 1
      case @tape[@index]
      when "]"
        level += 1
      when "["
        level -= 1
      end
      break if level == 0
    end
  end
end
