module TwentyFive
  module One
    def self.solve
      dial = Dial.new

      TwentyFive::FetchInput
        .call(1)
        .split("\n")
        .reduce(0) do |acc, instruction|
          acc += 1 if dial.turn(instruction).zero?

          acc
        end
    end
  end
end

class Node
  attr_accessor :value, :prev, :next

  def initialize(v)
    @value = v
  end

  def inspect
    { value:, prev: prev.value, next: self.next.value }
  end
end

class Dial
  attr_accessor :current, :dll

  def initialize
    nodes = (0..99).map { |i| Node.new(i) }

    nodes.each_cons(3) do |a, b, c|
      a.next = b

      b.prev = a
      b.next = c

      c.prev = b
    end

    nodes.first.prev = nodes.last
    nodes.last.next = nodes.first

    @dll = nodes
    @current = nodes[50]
  end

  def turn(instruction)
    direction = instruction[0]
    distance = instruction[1..].to_i

    case direction
    when 'L'
      distance.times { left }
    when 'R'
      distance.times { right }
    end

    @current.value
  end

  def left
    @current = @current.prev
  end

  def right
    @current = @current.next
  end
end
