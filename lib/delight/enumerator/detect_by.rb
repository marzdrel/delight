module Delight
  module Enumerator
    module DetectBy
      include CollectionMatcher

      def detect_by(**)
        detect do |element|
          collection_matcher(element, **)
        end
      end

      def detect_by!(**)
        detect! do |element|
          collection_matcher(element, **)
        end
      end
    end
  end
end
