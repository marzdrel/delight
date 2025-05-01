module Delight
  module DelightEnumerator
    refine Enumerable do
      import_methods CollectionMatcher
      import_methods HashCollectionMatcher

      import_methods SelectBy
      import_methods DetectBy
      import_methods DetectBang
      import_methods SelectByKey
      import_methods DetectByKey
      import_methods SoleBy
    end
  end
end
