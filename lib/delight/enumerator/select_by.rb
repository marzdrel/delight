module Delight
  module Enumerator
    module SelectBy
      # Filter colleciton elements using method calls and values passed as
      # keyword arguments.
      #
      # @return [Array] containingg elements that match the passed arguments.
      #
      # @example
      #   ["String", 1, 3, :symbol, 'string'].select_by(class: String)
      #     # => ["String", 'string']
      #
      #   Person = Struct.new(:name, :age)
      #
      #   people = [
      #     Person.new("John", 30),
      #     Person.new("Jane", 25),
      #     Person.new("Alice", 30),
      #   ]
      #
      #   people.select_by(age: 30)
      #   # => [
      #   #  Person.new("John", 30),
      #   #  Person.new("Alice", 30),
      #   # ]
      #
      def select_by(**)
        select do |element|
          collection_matcher(element, **)
        end
      end
    end
  end
end
