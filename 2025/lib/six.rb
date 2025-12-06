module TwentyFive
  module Six
    def self.solve(test = true)
      input = test ? test_input : FetchInput.call(6)

      columns =
        input
        .split("\n")
        .map(&:chars)
        .transpose

      sum = 0
      stack = []
      op = nil

      columns.each do |column|
        if column.all? { |x| x == ' ' }
          sum += stack.reduce(op)
          stack = []
          op = nil
          next
        end

        val = ''

        column.each_with_index do |char, i|
          if %w[+ - *].include?(char)
            op = char.to_sym
          else
            val << char
          end

          stack << val.to_i if i == column.length - 1
        end
      end

      sum += stack.reduce(op)
    end

    def self.test_input
      <<~INPUT
        123 328  51 64#{' '}
         45 64  387 23#{' '}
          6 98  215 314
        *   +   *   +#{'  '}
      INPUT
    end
  end
end
