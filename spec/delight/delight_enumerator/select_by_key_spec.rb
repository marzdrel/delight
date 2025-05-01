# frozen_string_literal: true

require "spec_helper"

module Delight
  RSpec.describe DelightEnumerator::SelectByKey do
    using DelightEnumerator

    describe "#select_by_key" do
      it "selects using a method" do
        data = [
          { name: "John", age: 30 },
          { name: "Adam", age: 34 },
          { name: "Jane", age: 30 },
        ]

        expect(data.select_by_key(age: 30))
          .to eq [
            { name: "John", age: 30 },
            { name: "Jane", age: 30 },
          ]
      end

      it "returns no values when no match" do
        data = [
          { name: "John", age: 30 },
          { name: "Adam", age: 34 },
          { name: "Jane", age: 30 },
        ]

        expect(data.select_by_key(age: 10))
          .to eq []
      end

      it "matches on all passed fields" do
        data = [
          { name: "John", age: 30 },
          { name: "Adam", age: 34 },
          { name: "Jane", age: 30 },
        ]

        expect(data.select_by_key(age: 30, name: "John"))
          .to eq [
            { name: "John", age: 30 },
          ]
      end
    end
  end
end
