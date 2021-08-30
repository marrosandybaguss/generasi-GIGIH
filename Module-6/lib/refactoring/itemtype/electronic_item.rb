module Refactoring
    class ElectronicItem
      def tags_valid?(tags)
        ['household','office','hobby','sports'].include?(tags)
      end
    end
  end