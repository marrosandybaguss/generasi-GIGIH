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

  describe '#returnable?' do
    context 'when returnable parameter' do
      it 'should return true' do
        stub_type = 'BOOK'
        stub_tags = 'fiction'

        harry_book_item = Refactoring::Item.new(stub_type, 'Harry Potter', 123, 33, stub_tags)

        expect(harry_book_item.returnable?).to eq(true)
      end
    end

    context 'when parameter given is not returnable' do
      it 'should return false' do
        stub_type = 'DRINK'
        stub_tags = 'fruit'

        mango_juice_item = Refactoring::Item.new(stub_type, 'Iga', 123, 33, stub_tags)

        expect(mango_juice_item.returnable?).to eq(false)
      end
    end
  end

  describe '#Percent of Tax' do
    context 'when type is book' do
      it 'should return 10 %' do
        stub_type = 'BOOK'
        stub_tags = 'fiction'

        harry_book_item = Refactoring::Item.new(stub_type, 'Harry Potter', 123, 33, stub_tags)

        expect(harry_book_item.tax_in_percent).to eq(10)
      end
    end

    context 'when type is electronic' do
      it 'should return 10 %' do
        stub_type = 'ELECTRONIC'
        stub_tags = 'office'

        fan_item = Refactoring::Item.new(stub_type, 'Fan', 123, 33, stub_tags)

        expect(fan_item.tax_in_percent).to eq(15)
      end
    end

    context 'when type is food, drink or snack' do
      it 'should return 5 %' do
        stub_type_food = 'FOOD'
        stub_tags_food = 'meat'
        iga_item = Refactoring::Item.new(stub_type_food, 'Iga', 123, 33, stub_tags_food)

        stub_type_drink = 'DRINK'
        stub_tags_drink = 'fruit'
        mango_juice_item = Refactoring::Item.new(stub_type_drink, 'Mango Juice', 123, 33, stub_tags_drink)

        stub_type_snack = 'SNACK'
        stub_tags_snack = 'meat'
        sukro_item = Refactoring::Item.new(stub_type_snack, 'Sukro', 123, 33, stub_tags_snack)

        expect(iga_item.tax_in_percent).to eq(5)
        expect(mango_juice_item.tax_in_percent).to eq(5)
        expect(sukro_item.tax_in_percent).to eq(5)
      end
    end

    # context 'when other type' do
    #   it 'should return 0 %' do
    #     stub_type = 'GAME'
    #     stub_tags = 'diamon'

    #     mobile_legends_item = Refactoring::Item.new(stub_type, 'Mobile Legends', 123, 33, stub_tags)

    #     expect(mobile_legends_item.tax_in_percent).to eq(0)
    #   end
    # end
  end
end
