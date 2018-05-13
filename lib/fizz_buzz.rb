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
  DEFAULT_RANGE = 1..100
  DEFAULT_TRIGGER = [
    ->(num) { 'Fizz'     if num.to_s.include?('3') },
    ->(num) { 'FizzBuzz' if (num % 15).zero? },
    ->(num) { 'Whizz'    if (num % 7).zero? },
    ->(num) { 'Buzz'     if (num % 5).zero? },
    ->(num) { 'Fizz'     if (num % 3).zero? },
    ->(num) { num }
  ].freeze

  def self.range(range = DEFAULT_RANGE, triggers = DEFAULT_TRIGGER)
    range.map { |num| result(num, triggers) }
  end

  def self.result(num, triggers = DEFAULT_TRIGGER)
    triggers.reduce(nil) { |memo, trigger| memo || trigger.call(num) }
  end
end

# if it is run as command line script, print result
puts FizzBuzz.range if $PROGRAM_NAME == __FILE__
