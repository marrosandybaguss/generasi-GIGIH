require "test_helper.rb"
require_relative "../src/increment_array_integer.rb"

RSpec.describe IncrementArrayInteger do

    it '561 to 562' do
        increment_array_integer = IncrementArrayInteger.new

        result = increment_array_integer.increment([5, 6, 1])

        expect(result).to eq([5, 6, 2])
    end

    it '39 to 40' do
        increment_array_integer = IncrementArrayInteger.new

        result = increment_array_integer.increment([3, 9])

        expect(result).to eq([4, 0])
    end

    it '99 to 100' do
        increment_array_integer = IncrementArrayInteger.new

        result = increment_array_integer.increment([3, 9])

        expect(result).to eq([4, 0])
    end

end