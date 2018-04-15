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
# what if user wanna change range of output?
# what if user need to add another rule like whizz, are we open/close?
# what if user wanna change the way of output, instead of printing?
module FizzBuzz
  module Predicate
    def self.divisible_by?(divisor)
      ->(x) { (x % divisor).zero? }
    end

    def self.with_digit?(digit)
      ->(x) { x.to_s.include?(digit.to_s) }
    end
  end

  DEFAULT_RANGE = 1..100
  DEFAULT_MAP   = {
    Predicate.with_digit?(3)    => 'Fizz',
    Predicate.divisible_by?(15) => 'FizzBuzz',
    Predicate.divisible_by?(7)  => 'Whizz',
    Predicate.divisible_by?(5)  => 'Buzz',
    Predicate.divisible_by?(3)  => 'Fizz'
  }.freeze

  def self.range(range = DEFAULT_RANGE, map = DEFAULT_MAP)
    range.map { |num| result(num, map) }
  end

  def self.result(num, map = DEFAULT_MAP)
    entry = map.find { |trigger, _result| trigger.call(num) } || [num, num]

    entry.last
  end
end

# if it is run as command line script, print result
puts FizzBuzz.range if $PROGRAM_NAME == __FILE__
