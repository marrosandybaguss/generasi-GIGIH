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
      when 'FOOD', 'DRINK', 'SNACK'
        5
      else 0
      end
    end

    private

    def validate_type(type)
      ['BOOK', 'ELECTRONIC', 'FOOD', 'DRINK', 'SNACK'].include?(type)
    end

    def validate_tags(type, tags)
      case type
      when 'BOOK'
        ['children', 'teen', 'adult', 'fiction', 'non-fiction'].include?(tags)
      when 'ELECTRONIC'
        ['household','office','hobby','sports'].include?(tags)
      when 'DRINK'
        ['dairy', 'vegetable', 'fruit', 'coffee', 'tea'].include?(tags)
      when 'FOOD'
        ['meat', 'dairy', 'vegetable', 'fruit', 'pastry'].include?(tags)
      when 'SNACK'
        ['meat', 'dairy', 'vegetable', 'fruit', 'pastry'].include?(tags)
      else false
      end
    end
  end
end
