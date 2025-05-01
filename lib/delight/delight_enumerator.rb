module Delight
  module DelightEnumerator
    refine Enumerable do
      import_methods SelectBy
      import_methods DetectBy
      import_methods DetectBang
      import_methods SelectByKey
      import_methods DetectByKey

      import_methods CollectionMatcher
      import_methods HashCollectionMatcher
    end
  end
end
