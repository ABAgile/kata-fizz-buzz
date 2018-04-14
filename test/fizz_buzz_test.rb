# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'

require 'fizz_buzz'

describe FizzBuzz do
  let(:result) { (1..100).to_a }

  it 'must return correct result' do
    assert_equal result, FizzBuzz.result
  end
end
