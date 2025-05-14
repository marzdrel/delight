module Delight
  module Enumerator
    module SelectBy
      include CollectionMatcher

      def select_by(**)
        select do |element|
          collection_matcher(element, **)
        end
      end
    end
  end
end
