# frozen_string_literal: true

# write a program that prints the numbers from 1 to 100
# for multiples of three print "Fizz" instead of the number
# for the multiples of five print "Buzz"
# for the multiples of seven print "Whizz"
# for numbers which are multiples of both three and five print "FizzBuzz"
#
# at the moment we can't predict result(15) is a specific handling, or
# it implies combining result of result(3) & result(5), and that will
# lead to quite different direction of how our structure
#
# let's examine solid principle
# 1. is it DRY?
# 2. is it single responbility?
# 3. does our code change at the same rate?
# 4. does our code depend on something that is more stable?
#
module FizzBuzz
  def self.output
    (1..100).each do |num|
      puts result(num)
    end
  end

  def self.result(num)
    divisible = {
      15 => 'FizzBuzz',
      7  => 'Whizz',
      5  => 'Buzz',
      3  => 'Fizz'
    }.find { |key, _val| divisible_by?(num, key) } || [num, num]

    divisible.last
  end

  def self.divisible_by?(num, divisor)
    (num % divisor).zero?
  end
end

# if it is run as command line script, print result
puts FizzBuzz.output if $PROGRAM_NAME == __FILE__
