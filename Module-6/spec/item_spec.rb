require_relative '../lib/refactoring/item'

RSpec.describe Refactoring::Item do
  describe '#initialize' do
    context 'when valid parameter' do
      it 'return apropiate value' do
        stub_type = 'BOOK'
        stub_tags = 'fiction'

        harry_book_item = Refactoring::Item.new(stub_type, 'Harry Potter', 123, 33, stub_tags)

        mock_type = 'BOOK'
        mock_name = 'Harry Potter'
        mock_price = 123
        mock_stock = 33
        mock_tags = 'fiction'

        expect(harry_book_item.type).to eq(mock_type)
        expect(harry_book_item.name).to eq(mock_name)
        expect(harry_book_item.price).to eq(mock_price)
        expect(harry_book_item.stock).to eq(mock_stock)
        expect(harry_book_item.tags).to eq(mock_tags)
      end
    end

    context 'when invalid parameter' do
      it 'raise argument error' do
        stub_type = 'BOOK'
        stub_tags = 'meat'

        expect{ Refactoring::Item.new(stub_type, 'Iga', 123, 33, stub_tags) }.to raise_error(ArgumentError)
      end
    end
  end
end
