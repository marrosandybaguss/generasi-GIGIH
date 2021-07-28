require_relative "../src/increment_integer.rb"

RSpec.describe IncrementInteger do

    it '561 to 562' do
        increment_integer = IncrementInteger.new

        result = increment_integer.increment([5, 6, 1])

        expect(result).to eq([5, 6, 2])
    end

    it '39 to 40' do
        increment_integer = IncrementInteger.new

        result = increment_integer.increment([3, 9])

        expect(result).to eq([4, 0])
    end

    it '99 to 100' do
        increment_integer = IncrementInteger.new

        result = increment_integer.increment([3, 9])

        expect(result).to eq([4, 0])
    end

end