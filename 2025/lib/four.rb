module TwentyFive
  module Four
    def self.solve(test = true)
      input = test ? test_input : FetchInput.call(4)

      rolls = Set.new

      input.split("\n").each_with_index do |line, row|
        line.chars.each_with_index do |char, col|
          rolls.add([row, col]) if char == '@'
        end
      end

      remove_acessible(rolls)
    end

    def self.remove_acessible(rolls, total = 0)
      to_remove = rolls.select { |row, col| accessible?(rolls, row, col) }

      return total if to_remove.empty?

      to_remove.each { |roll| rolls.delete(roll) }

      remove_acessible(rolls, total + to_remove.length) # 😎
    end

    def self.accessible?(rolls, row, col)
      # rubocop:disable Layout/ExtraSpacing
      neighbors = [
        [-1, -1], [-1, 0], [-1, 1],
        [0, -1],           [0, 1],
        [1, -1],  [1, 0],  [1, 1]
      ]
      # rubocop:enable Layout/ExtraSpacing

      neighbors.count { |x, y| rolls.include?([row + x, col + y]) } < 4
    end

    def self.test_input
      <<~INPUT
        ..@@.@@@@.
        @@@.@.@.@@
        @@@@@.@.@@
        @.@@@@..@.
        @@.@@@@.@@
        .@@@@@@@.@
        .@.@.@.@@@
        @.@@@.@@@@
        .@@@@@@@@.
        @.@.@@@.@.
      INPUT
    end
  end
end
