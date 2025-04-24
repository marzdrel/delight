module Delight
  module DelightEnumerator
    module DetectBy
      include CollectionMatcher

      def detect_by(**)
        detect do |element|
          collection_matcher(element, **)
        end
      end
    end
  end
end
