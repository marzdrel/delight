module Delight
  module Enumerator
    module SoleByKey
      def sole_by_key(**)
        sole_by_implementation(:hash_collection_matcher, **)
      end
    end
  end
end
