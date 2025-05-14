module Delight
  module Enumerator
    module SoleBy
      def sole_by(**)
        sole_by_implementation(:collection_matcher, **)
      end

      private

      def sole_by_implementation(searcher, **)
        results = lazy.select do |element|
          public_send(searcher, element, **)
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
