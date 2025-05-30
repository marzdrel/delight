module Delight
  module Enumerator
    module SelectByKey
      def select_by_key(**)
        select do |element|
          hash_collection_matcher(element, **)
        end
      end
    end
  end
end
