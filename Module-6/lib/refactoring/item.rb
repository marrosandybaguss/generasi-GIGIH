require_relative 'itemtype/book_item'
require_relative 'itemtype/drink_item'
require_relative 'itemtype/electronic_item'
require_relative 'itemtype/food_item'
require_relative 'itemtype/snack_item'

module Refactoring
  class Item
    attr_reader :name, :price, :type, :stock, :tags

    def initialize(type, name, price, stock, tags)
      type_valid = validate_type(type)
      tags_valid = validate_tags(type, tags)
      if type_valid and tags_valid
        @type = type
        @name = name
        @price = price
        @stock =  stock
        @tags = tags
      else
        raise ArgumentError
      end
    end
    
    def returnable?
      if ['BOOK', 'ELECTRONIC'].include?(@type)
        true
      else
        false
      end
    end

    def tax_in_percent
      case @type
      when 'BOOK'
        10
      when 'ELECTRONIC'
        15
      else
        5
      end
    end

    private

    def validate_type(type)
      ['BOOK', 'ELECTRONIC', 'FOOD', 'DRINK', 'SNACK'].include?(type)
    end

    def validate_tags(type, tags)
      case type
      when 'BOOK'
        BookItem.new.tags_valid?(tags)
      when 'ELECTRONIC'
        ElectronicItem.new.tags_valid?(tags)
      when 'DRINK'
        DrinkItem.new.tags_valid?(tags)
      when 'FOOD'
        FoodItem.new.tags_valid?(tags)
      when 'SNACK'
        SnackItem.new.tags_valid?(tags)
      else false
      end
    end
  end
end
