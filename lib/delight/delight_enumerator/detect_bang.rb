module Delight
  module DelightEnumerator
    module DetectBang
      include CollectionMatcher

      # This method finds required element or raises error if the element is
      # not found. This is similar to sole, but returns first element (so
      # duplicates are possible) but doesn't need to traverse whole Array.

      def detect!(error_message: nil, &)
        default_error_message = "No element found"
        detect(&) || raise(Error::ElementNotFound, error_message || default_error_message)
      end
    end
  end
end
