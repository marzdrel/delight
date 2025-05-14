module Delight
  module Enumerator
    module DetectByKey
      include HashCollectionMatcher

      def detect_by_key(**)
        detect do |element|
          hash_collection_matcher(element, **)
        end
      end

      def detect_by_key!(**)
        detect! do |element|
          hash_collection_matcher(element, **)
        end
      end
    end
  end
end
