module Delight
  module DelightEnumerator
    module SelectByKey
      include HashCollectionMatcher

      def select_by_key(**)
        select do |element|
          hash_collection_matcher(element, **)
        end
      end
    end
  end
end
