module Refactoring
    class FoodItem
      def tags_valid?(tags)
        ['meat', 'dairy', 'vegetable', 'fruit', 'pastry'].include?(tags)
      end
    end
  end