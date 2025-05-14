module Delight
  module Enumerator
    module DetectByKey
      def detect_by_key(**)
        detect do |element|
          hash_collection_matcher(element, **)
        end
      end

      def detect_by_key!(**)
        detect! do |element|
          hash_collection_matcher(element, **)
        end
      end
    end
  end
end
