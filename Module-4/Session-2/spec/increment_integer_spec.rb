require_relative "../src/increment_integer.rb"

RSpec.describe IncrementInteger do

    it '561 to 562' do
        increment_integer = IncrementInteger.new

        result = increment_integer.increment([5, 6, 1])

        expect(result).to eq([5, 6, 2])
    end

end