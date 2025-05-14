module Delight
  module Enumerator
    module HashCollectionMatcher
      def hash_collection_matcher(element, **kwargs)
        kwargs.all? do |key, value|
          element.key?(key) && element.fetch(key) == value
        end
      end
    end
  end
end
