require_relative '../lib/refactoring/order_item'
require_relative '../lib/refactoring/item'

RSpec.describe Refactoring::OrderItem do
  describe 'Price of Order item' do
    context 'more than 10 quantity' do
      it 'with voucher' do
        harry_book_item = Refactoring::Item.new('BOOK', 'Harry Potter', 100, 33, 'fiction')
        quantity = 11
        harry_book_order = Refactoring::OrderItem.new(harry_book_item, quantity)
        voucher = true

        price = harry_book_item.price * quantity
        discount_price = price * 0.8

        expect(harry_book_order.calculate_price(voucher)).to eq(discount_price)
      end

      it 'without voucher' do
        harry_book_item = Refactoring::Item.new('BOOK', 'Harry Potter', 100, 33, 'fiction')
        quantity = 11
        harry_book_order = Refactoring::OrderItem.new(harry_book_item, quantity)
        voucher = false
  
        price = harry_book_item.price * quantity
  
        expect(harry_book_order.calculate_price(voucher)).to eq(price)
      end
    end

    context 'quantity more than 5 but under 10' do
      it 'with voucher' do
        harry_book_item = Refactoring::Item.new('BOOK', 'Harry Potter', 100, 33, 'fiction')
        quantity = 7
        harry_book_order = Refactoring::OrderItem.new(harry_book_item, quantity)
        voucher = true

        price = harry_book_item.price * quantity
        discount_price = price * 0.9

        expect(harry_book_order.calculate_price(voucher)).to eq(discount_price)
      end

      it 'without voucher' do
        harry_book_item = Refactoring::Item.new('BOOK', 'Harry Potter', 100, 33, 'fiction')
        quantity = 7
        harry_book_order = Refactoring::OrderItem.new(harry_book_item, quantity)
        voucher = false
  
        price = harry_book_item.price * quantity
  
        expect(harry_book_order.calculate_price(voucher)).to eq(price)
      end
    end

    context 'quantity more than 2 but under 5' do
      it 'with voucher' do
        harry_book_item = Refactoring::Item.new('BOOK', 'Harry Potter', 100, 33, 'fiction')
        quantity = 3
        harry_book_order = Refactoring::OrderItem.new(harry_book_item, quantity)
        voucher = true

        price = harry_book_item.price * quantity
        discount_price = price * 0.95

        expect(harry_book_order.calculate_price(voucher)).to eq(discount_price)
      end

      it 'without voucher' do
        harry_book_item = Refactoring::Item.new('BOOK', 'Harry Potter', 100, 33, 'fiction')
        quantity = 3
        harry_book_order = Refactoring::OrderItem.new(harry_book_item, quantity)
        voucher = false
  
        price = harry_book_item.price * quantity
  
        expect(harry_book_order.calculate_price(voucher)).to eq(price)
      end
    end
  end
end
