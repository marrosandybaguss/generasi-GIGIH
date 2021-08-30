module Refactoring
  class BookItem
    def tags_valid?(tags)
      ['children', 'teen', 'adult', 'fiction', 'non-fiction'].include?(tags)
    end
  end
end