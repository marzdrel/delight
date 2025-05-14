module Delight
  module Enumerator
    module CollectionMatcher
      def collection_matcher(element, **kwargs)
        kwargs.all? do |key, value|
          element.public_send(key) == value
        end
      end
    end
  end
end
