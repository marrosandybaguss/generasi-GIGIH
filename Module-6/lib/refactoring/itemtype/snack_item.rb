module Refactoring
    class SnackItem
      def tags_valid?(tags)
        ['meat', 'dairy', 'vegetable', 'fruit', 'pastry'].include?(tags)
      end
    end
  end