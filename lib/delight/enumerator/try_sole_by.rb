module Delight
  module Enumerator
    module TrySoleBy
      def try_sole_by(**)
        try_sole_by_implementation(:collection_matcher, **)
      end

      private

      def try_sole_by_implementation(searcher, **)
        results = lazy.select do |element|
          public_send(searcher, element, **)
        end

        found, undesired = results.first(2)

        if undesired
          raise Error::SoleItemExpected, undesired
        end

        found
      end
    end
  end
end
