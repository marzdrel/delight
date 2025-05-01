module Delight
  module DelightEnumerator
    module SoleBy
      include CollectionMatcher

      def sole_by(**)
        results = lazy.select do |element|
          collection_matcher(element, **)
        end

        found, undesired = results.first(2)

        if found.nil?
          raise Error::ElementNotFound
        elsif undesired
          raise Error::SoleItemExpected, undesired
        end

        found
      end
    end
  end
end
