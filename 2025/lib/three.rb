require 'pry-byebug'

module TwentyFive
  module Three
    def self.solve(test = true)
      input = test ? test_input : FetchInput.call(3)

      input.split("\n").sum do |str|
        bank = str.chars.map(&:to_i)
        batteries = []

        bank.each_with_index do |n, i|
          available = bank.length - i

          batteries.pop until batteries.empty? || (12 - batteries.length) == available || n <= batteries.last

          batteries.push(n) unless batteries.length == 12
        end

        batteries.join.to_i
      end
    end

    def self.test_input
      <<~INPUT
        987654321111111
        811111111111119
        234234234234278
        818181911112111
      INPUT
    end
  end
end
