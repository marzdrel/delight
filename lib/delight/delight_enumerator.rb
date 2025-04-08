module Delight
  module DelightEnumerator
    refine Enumerable do
      import_methods CollectionMatcher

      def select_by(**)
        select do |element|
          collection_matcher(element, **)
        end
      end
    end
  end
end
