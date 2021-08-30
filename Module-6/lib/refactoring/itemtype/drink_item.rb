module Refactoring
    class DrinkItem
      def tags_valid?(tags)
        ['dairy', 'vegetable', 'fruit', 'coffee', 'tea'].include?(tags)
      end
    end
  end