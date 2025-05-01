module Delight
  module DelightEnumerator
    refine Enumerable do
      import_methods CollectionMatcher
      import_methods SelectBy
      import_methods DetectBy
      import_methods DetectBang
    end
  end
end
