module Delight
  module Enumerator
    module CollectionMatcher
      def collection_matcher(element, **kwargs)
        kwargs.all? do |key, value|
          value === element.public_send(key)
        end
      end
    end
  end
end
