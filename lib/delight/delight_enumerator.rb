module Delight
  module DelightEnumerator
    refine Enumerable do
      import_methods CollectionMatcher
      import_methods ByMethods
    end
  end
end
