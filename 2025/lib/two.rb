module TwentyFive
  module Two
    def self.solve(test = true)
      input = test ? test_input : FetchInput.call(2).strip
      str_ranges = input.split(',')

      str_ranges.sum do |str_range|
        start, stop = str_range.split('-').map(&:to_i)

        (start..stop).sum { |number| only_repeating_sequences?(number.to_s) ? number : 0 }
      end
    end

    def self.only_repeating_sequences?(str)
      length = str.length

      (1..length / 2).any? do |sequence_length|
        sequence = str[...sequence_length]
        times_it_has_to_repeat = length / sequence_length

        (sequence * times_it_has_to_repeat) == str
      end
    end

    # 1227775554
    def self.test_input
      '11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124'
    end
  end
end
