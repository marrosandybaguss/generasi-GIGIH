module Refactoring
    class FoodItem
      def tags_valid?(tags)
        ['meat', 'dairy', 'vegetable', 'fruit', 'pastry'].include?(tags)
      end
      
      def tax_in_percent
        5
      end

      def returnable?
        false
      end
    end
  end