module TwentyFive
  module Five
    def self.solve(test = true)
      input = test ? test_input : FetchInput.call(5)

      merged_ranges, product_ids =
        input
        .split("\n")
        .map { |x| x.split('-').map(&:to_i) } # [[3,5], [10, 14], [], [1], [5]]
        .reduce([[], []]) do |(ranges, ids), x|
        ranges << x if x.length > 1
        ids << x.first.to_i if x.one?

        if x.empty?
          merged = []

          ranges
            .sort_by(&:first)
            .each do |range|
            if merged.empty? || merged.last[1] < range[0]
              merged << range
            else
              merged.last[1] = [merged.last[1], range[1]].max
            end
          end

          ranges = merged
        end

        [ranges, ids]
      end

      product_ids.sum do |id|
        if merged_ranges.any? { |range| range[0] <= id && range[1] >= id }
          1
        else
          0
        end
      end
    end

    def self.test_input
      <<~INPUT
        3-5
        10-14
        16-20
        12-18

        1
        5
        8
        11
        17
        32
      INPUT
    end
  end
end
