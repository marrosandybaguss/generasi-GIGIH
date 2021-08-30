module Refactoring
    class ElectronicItem
      def tags_valid?(tags)
        ['household','office','hobby','sports'].include?(tags)
      end

      def tax_in_percent
        15
      end

      def returnable?
        true
      end
    end
  end