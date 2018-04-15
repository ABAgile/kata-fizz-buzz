# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'

require 'fizz_buzz'

describe FizzBuzz do
  let(:fizz)     { 'Fizz' }
  let(:buzz)     { 'Buzz' }
  let(:whizz)    { 'Whizz' }
  let(:fizzbuzz) { fizz + buzz }

  it 'must return Fizz on multiple of 3' do
    assert_equal fizz, FizzBuzz.result(3)
    assert_equal fizz, FizzBuzz.result(6)
    assert_equal fizz, FizzBuzz.result(9)
  end

  it 'must return Buzz on multiple of 5' do
    assert_equal buzz, FizzBuzz.result(5)
    assert_equal buzz, FizzBuzz.result(10)
    assert_equal buzz, FizzBuzz.result(20)
  end

  it 'must return FizzBuzz on multiple of 15' do
    assert_equal fizzbuzz, FizzBuzz.result(15)
    assert_equal fizzbuzz, FizzBuzz.result(30)
    assert_equal fizzbuzz, FizzBuzz.result(45)
  end

  it 'must return Whizz on multiple of 7' do
    assert_equal whizz, FizzBuzz.result(7)
    assert_equal whizz, FizzBuzz.result(14)
    assert_equal whizz, FizzBuzz.result(21)
  end

  it 'must return Fizz on numbers containing digit of 3' do
    assert_equal fizz, FizzBuzz.result(3)
    assert_equal fizz, FizzBuzz.result(13)
    assert_equal fizz, FizzBuzz.result(23)
  end
end
