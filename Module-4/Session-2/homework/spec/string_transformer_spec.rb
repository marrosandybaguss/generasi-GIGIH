require "test_helper.rb"
require_relative "../src/string_transformer.rb"

RSpec.describe StringTransformer do
    it 'return k if passed b' do
        string_transformer = StringTransformer.new

        result = string_transformer.transform('b')

        expect(result).to eq('k')
    end

    it 'return z if passed e' do
        string_transformer = StringTransformer.new

        result = string_transformer.transform('e')

        expect(result).to eq('z')
    end

end