require "spec_helper"

module Delight
  RSpec.describe DelightEnumerator do
    using described_class

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

      it "returns on values when no match" do
        stub = Struct.new(:name, :age)

        data = [
          stub.new("John", 30),
          stub.new("Doe", 40),
        ]

        expect(data.select_by(age: 10))
          .to eq []
      end
    end
  end
end
