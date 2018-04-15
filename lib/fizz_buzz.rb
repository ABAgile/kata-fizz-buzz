# frozen_string_literal: true

# write a program that prints the numbers from 1 to 100
# for multiples of three print "Fizz" instead of the number
# for the multiples of five print "Buzz"
# for numbers which are multiples of both three and five print "FizzBuzz"
#
class FizzBuzz
  def self.output
    (1..100).each do |i|
      puts result(i)
    end
  end

  def self.result(num)
    {
      15 => 'FizzBuzz',
      5  => 'Buzz',
      3  => 'Fizz'
    }.find { |key, _val| divisible_by?(num, key) }&.last || num
  end

  def self.divisible_by?(num, divisor)
    (num % divisor).zero?
  end
end

# if it is run as command line script, print result
puts FizzBuzz.output if $PROGRAM_NAME == __FILE__
