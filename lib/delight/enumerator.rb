module Delight
  module Enumerator
    refine Enumerable do
      import_methods CollectionMatcher
      import_methods HashCollectionMatcher

      import_methods SelectByMethods
      import_methods SelectByKey

      import_methods DetectBang
      import_methods DetectBy
      import_methods DetectByKey

      import_methods SoleBy
      import_methods SoleByKey

      import_methods TrySoleBy
      # import_methods TrySoleByKey
    end
  end
end
