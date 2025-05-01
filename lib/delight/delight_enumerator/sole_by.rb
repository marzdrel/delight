module Delight
  module DelightEnumerator
    module SoleBy
      include CollectionMatcher

      def sole_by(**)
        element, rest = select do |element|
          collection_matcher(element, **)
        end
      end
    end
  end
end
