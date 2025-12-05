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

      # rubocop:disable Layout/ExtraSpacing
      neighbors = [
        [-1, -1], [-1, 0], [-1, 1],
        [0, -1],           [0, 1],
        [1, -1],  [1, 0],  [1, 1]
      ]
      # rubocop:enable Layout/ExtraSpacing

      rolls.count do |row, col|
        neighbors.count { |x, y| rolls.include?([row + x, col + y]) } < 4
      end
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
