module Refactoring
  class Order
    attr_reader :order_items, :tax, :delivery_cost

    def initialize(order_items, tax, delivery_cost)
      @order_items = order_items
      @tax = tax
      @delivery_cost = delivery_cost
    end

    def price_order(voucher)
      price = 0
  
      @order_items.each do |order_item|
        price += order_item.calculate_price(voucher)
      end
  
      price_after_tax = price + (@tax * price)
      total_price = price_after_tax + @delivery_cost
    end  

    def order_summary_to_s
      food_items = Array.new
      drink_items = Array.new
      snack_items = Array.new
      
      @order_items.each do |order_item|
        case order_item.item.type
        when "FOOD"
          food_items << order_item
        when "DRINK"
          drink_items << order_item
        when "SNACK"
          snack_items << order_item
        else
          raise "item type #{order_item.item.type} is not supported"
        end
      end

      to_s = "Food items:\n"
      food_items.each do |food_item|
        to_s += "#{food_item.quantity} #{food_item.item.name}"
      end
      to_s += "Drink items:\n"
      drink_items.each do |drink_item|
        to_s += "#{drink_item.quantity} #{drink_item.item.name}"
      end
      to_s += "Snack items:\n"
      snack_items.each do |snack_item|
        to_s += "#{snack_item.quantity} #{snack_item.item.name}"
      end
      return to_s
    end
  end
end
