module Delight
  module DelightEnumerator
    refine Enumerable do
      def select_by(**)
        select do |element|
          collection_matcher(element, **)
        end
      end

      private

      def collection_matcher(element, **kwargs)
        kwargs.all? do |key, value|
          element.public_send(key) == value
        end
      end
    end
  end
end
