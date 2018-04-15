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
  class DefaultHandler
    def initialize(num)
      @num = num
    end

    def self.trigger?(_num)
      true
    end

    def result
      @num
    end
  end

  class DivisbleByThree < DefaultHandler
    def self.trigger?(num)
      (num % 3).zero?
    end

    def result
      'Fizz'
    end
  end

  class WithDigitThree < DivisbleByThree
    def self.trigger?(num)
      num.to_s.include?('3')
    end
  end

  class DivisbleByFifteen < DefaultHandler
    def self.trigger?(num)
      (num % 15).zero?
    end

    def result
      'FizzBuzz'
    end
  end

  class DivisbleByFive < DefaultHandler
    def self.trigger?(num)
      (num % 5).zero?
    end

    def result
      'Buzz'
    end
  end

  class DivisbleBySeven < DefaultHandler
    def self.trigger?(num)
      (num % 7).zero?
    end

    def result
      'Whizz'
    end
  end

  DEFAULT_RANGE   = 1..100
  DEFAULT_TRIGGER = [
    WithDigitThree, DivisbleByFifteen, DivisbleBySeven,
    DivisbleByFive, DivisbleByThree, DefaultHandler
  ].freeze

  def self.range(range = DEFAULT_RANGE, trigger = DEFAULT_TRIGGER)
    range.map { |num| result(num, trigger) }
  end

  def self.result(num, trigger = DEFAULT_TRIGGER)
    trigger.find { |klass| klass.trigger?(num) }.new(num).result
  end
end

# if it is run as command line script, print result
puts FizzBuzz.range if $PROGRAM_NAME == __FILE__
