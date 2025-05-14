# frozen_string_literal: true

require "spec_helper"

module Delight
  RSpec.describe Enumerator::SelectByMethods do
    using Enumerator::SelectBy

    describe "#select_by" do
      it "selects using a method" do
        stub = Struct.new(:name, :age)

        data = [
          stub.new("John", 30),
          stub.new("Jane", 25),
          stub.new("Alice", 30),
          stub.new("Doe", 40),
        ]

        expect(data.select_by(age: 30))
          .to eq [
            stub.new("John", 30),
            stub.new("Alice", 30),
          ]
      end

      it "fails on invalid method name" do
        stub = Struct.new(:name, :age)

        data = [
          stub.new("John", 30),
          stub.new("Doe", 40),
        ]

        expect { data.select_by(lastname: 30) }
          .to raise_error NoMethodError, /undefined method/
      end

      it "returns no values when no match" do
        stub = Struct.new(:name, :age)

        data = [
          stub.new("John", 30),
          stub.new("Doe", 40),
        ]

        expect(data.select_by(age: 10))
          .to eq []
      end

      it "matches on all passed fields" do
        stub = Struct.new(:name, :age)

        data = [
          stub.new("John", 30),
          stub.new("Doe", 30),
        ]

        expect(data.select_by(age: 30, name: "John"))
          .to eq [
            stub.new("John", 30),
          ]
      end

      it "matches on range" do
        stub = Struct.new(:name, :age)

        data = [
          stub.new("John", 11),
          stub.new("Doe", 19),
          stub.new("Doe", 34),
        ]

        expect(data.select_by(age: 18..))
          .to eq [
            stub.new("Doe", 19),
            stub.new("Doe", 34),
          ]
      end

      it "matches on range" do
        stub = Struct.new(:name, :age)

        data = [
          18,
          2.3,
          "Alice",
        ]

        expect(data.select_by(itself: Numeric))
          .to eq [18, 2.3]
      end
    end
  end
end

