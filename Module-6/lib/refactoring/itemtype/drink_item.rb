module Refactoring
  class DrinkItem
    def tags_valid?(tags)
      ['dairy', 'vegetable', 'fruit', 'coffee', 'tea'].include?(tags)
    end
    
    def tax_in_percent
      5
    end

    def returnable?
      false
    end
  end
end