module Delight
  module DelightEnumerator
    module DetectBang
      class ElementNotFound < StandardError
      end

      include CollectionMatcher

      # This method finds required element or raises error if the element is
      # not found. This is similar to sole, but returns first element (so
      # duplicates are possible) but doesn't need to traverse whole Array.

      def detect!(error_message: nil, &)
        default_error_message = "No element found"
        detect(&) || raise(ElementNotFound, error_message || default_error_message)
      end
    end
  end
end
