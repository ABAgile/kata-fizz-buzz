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
end
