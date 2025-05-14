module Delight
  module Enumerator
    module SelectBy
      refine Enumerable do
        import_methods CollectionMatcher
        import_methods SelectByMethods
      end
    end
  end
end
