# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'

require 'fizz_buzz'

describe FizzBuzz do
  let(:fizz)     { 'Fizz' }
  let(:buzz)     { 'Buzz' }
  let(:fizzbuzz) { fizz + buzz }

  it 'must return Fizz on multiple of 3' do
    assert_equal fizz, FizzBuzz.result(3)
    assert_equal fizz, FizzBuzz.result(6)
    assert_equal fizz, FizzBuzz.result(9)
  end

  it 'must return Buzz on multiple of 5' do
    assert_equal buzz, FizzBuzz.result(5)
    assert_equal buzz, FizzBuzz.result(10)
    assert_equal buzz, FizzBuzz.result(15)
  end
end
