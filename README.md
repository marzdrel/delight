# Delight

Delight is a Ruby gem offering small yet useful extensions to the core Ruby classes. Those extensions are implemented as Refinements, which means they are only available in the scope where they are explicitly activated. This allows you to use them without worrying about polluting the global namespace or causing conflicts with other gems.

## Installation

```bash
bundle add delight
```

## Usage

In order to import all available methods use the global `Delight::Enumerable` refinement.

```ruby
class MyClass
  using Delight::Enumerable

  def initialize(some_list)
    @some_list = some_list
  end

  def my_method
    some_list.select_by(country: "PL")
  end
end
```

### `.select_by`

The `.select_by` method allows you to filter an array of objects based on a
value(s) of single or multiple methods. Object in the collection must respond to
the methods you are filtering by. Calling non-existing method will raise an
`NoMethodError`.

```ruby
# Following examples are equivalent:
addresses.select_by(country: "PL", city: "Warsaw")
addresses.select { it.country == "PL" && it.city == "Warsaw" }
```

Values are compared using `===` operator, so you can use any object that
implements it. For example, you can use a range.

```ruby
# Following examples are equivalent:
addresses.select_by(age: 18..)
addresses.select { it.age >= 18 }
addresses.select { 18.. === it.age }
```

Warning, be aware of of the `===` operator behavior. For example, if you would
like to filter out the object by its class, you need to use the object itself as the
argument, thus pass the `itself` method:

```ruby
# Following examples are equivalent:
[18, 2.5, "foo"].select_by(itself: Numeric) # => [18, 2.5]
[18, 2.5, "foo"].select { it.is_a?(Numeric) } # => [18, 2.5]
```

## Development

[...]

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
