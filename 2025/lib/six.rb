module TwentyFive
  module Six
    def self.solve(test = true)
      input = test ? test_input : FetchInput.call(6)

      input
        .split("\n")
        .map { |l| l.split(' ') }
        .reduce([]) do |columns, line|
          line.each_with_index do |val, i|
            columns[i] = [] if columns[i].nil?

            if %w[+ - *].include?(val)
              columns[i] = columns[i].reduce(val.to_sym)
            else
              columns[i] << val.to_i
            end
          end

          columns
        end
        .sum
    end

    def self.test_input
      <<~INPUT
        123 328  51 64#{' '}
         45 64  387 23#{' '}
          6 98  215 314#{'  '}
        *   +   *   +#{'  '}
      INPUT
    end
  end
end
