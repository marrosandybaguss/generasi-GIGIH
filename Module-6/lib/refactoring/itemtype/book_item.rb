module Refactoring
  class BookItem
    def tags_valid?(tags)
      ['children', 'teen', 'adult', 'fiction', 'non-fiction'].include?(tags)
    end

    def tax_in_percent
      10
    end

    def returnable?
      true
    end
  end
end