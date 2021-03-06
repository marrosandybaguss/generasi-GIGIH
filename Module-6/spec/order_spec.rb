require_relative '../lib/refactoring/item'
require_relative '../lib/refactoring/order_item'
require_relative '../lib/refactoring/order'

RSpec.describe Refactoring::Order do
  before(:each) do
    harry_book_item = Refactoring::Item.new('BOOK', 'Harry Potter', 100, 33, 'fiction')
    harry_book_order = Refactoring::OrderItem.new(harry_book_item, 11)
    mango_juice_item = Refactoring::Item.new('DRINK', 'Mango Juice', 100, 33, 'fruit')
    mango_juice_order = Refactoring::OrderItem.new(mango_juice_item, 5)
    fan_item = Refactoring::Item.new('ELECTRONIC', 'Fan', 100, 33, 'office')
    fan_order = Refactoring::OrderItem.new(fan_item, 11)

    @order_items = [harry_book_order, mango_juice_order, fan_order]
  end

  describe 'Price of Order' do
    it 'with voucher' do
      tax = 0.1
      delivery_cost = 25
      marro_order = Refactoring::Order.new(@order_items, tax, delivery_cost)
      voucher = true

      mock_price = 0
      mock_price += @order_items[0].calculate_price(voucher)
      mock_price += @order_items[1].calculate_price(voucher)
      mock_price += @order_items[2].calculate_price(voucher)
      mock_price_after_tax = mock_price + (tax * mock_price)
      total_mock_price = mock_price_after_tax + delivery_cost

      expect(marro_order.price_order(voucher)).to eq(total_mock_price)
    end

    it 'without voucher' do
      tax = 0.1
      delivery_cost = 25
      marro_order = Refactoring::Order.new(@order_items, tax, delivery_cost)
      voucher = false

      mock_price = 0
      mock_price += @order_items[0].calculate_price(voucher)
      mock_price += @order_items[1].calculate_price(voucher)
      mock_price += @order_items[2].calculate_price(voucher)
      mock_price_after_tax = mock_price + (tax * mock_price)
      total_mock_price = mock_price_after_tax + delivery_cost

      expect(marro_order.price_order(voucher)).to eq(total_mock_price)
    end
  end

  describe 'Order Summary' do
    context 'when given allowed type' do
      it 'should return string of order summary' do
        iga_item = Refactoring::Item.new('FOOD', 'Iga', 100, 33, 'meat')
        iga_order = Refactoring::OrderItem.new(iga_item, 11)
        mango_juice_item = Refactoring::Item.new('DRINK', 'Mango Juice', 100, 33, 'fruit')
        mango_juice_order = Refactoring::OrderItem.new(mango_juice_item, 5)
        sukro_item = Refactoring::Item.new('SNACK', 'Sukro', 100, 33, 'dairy')
        sukro_order = Refactoring::OrderItem.new(sukro_item, 11)
        order_items = [iga_order, mango_juice_order, sukro_order]

        tax = 0.1
        delivery_cost = 25
        marro_order = Refactoring::Order.new(order_items, tax, delivery_cost)
        voucher = true

        mock_string = "Food items:\n11 IgaDrink items:\n5 Mango JuiceSnack items:\n11 Sukro"
        expect(marro_order.order_summary_to_s).to eq(mock_string)
      end
    end

    context 'when given not allowed type' do
      it 'should raise eror' do
        tax = 0.1
        delivery_cost = 25
        marro_order = Refactoring::Order.new(@order_items, tax, delivery_cost)
        voucher = true

        expect{ marro_order.order_summary_to_s }.to raise_error('item type BOOK is not supported')
      end
    end
  end
end
