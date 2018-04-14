# frozen_string_literal: true

# write a program that prints the numbers from 1 to 100
# for multiples of three print "Fizz" instead of the number
# for the multiples of five print "Buzz"
# for numbers which are multiples of both three and five print "FizzBuzz"
#
class FizzBuzz
  def self.output
    puts result
  end

  def self.result
    (1..100).to_a
  end
end

# if it is run as command line script, print result
puts FizzBuzz.output if $PROGRAM_NAME == __FILE__
