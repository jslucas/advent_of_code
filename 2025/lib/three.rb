module TwentyFive
  module Three
    def self.solve(test = true)
      input = test ? test_input : FetchInput.call(3)

      input.split("\n").sum do |bank|
        length = bank.length
        l = 0
        r = 0

        # 8 1 8 1 8 1 9 1 1 1 1 2 1 1 1
        # l r
        # l   r
        #             l
        #             l r
        #             l         r
        bank.each_char.with_index do |c, i|
          n = c.ord

          if n > l && i < length - 1
            l = n
            r = 0
            next
          elsif n > r
            r = n
            next
          end
        end

        (l.chr + r.chr).to_i
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
