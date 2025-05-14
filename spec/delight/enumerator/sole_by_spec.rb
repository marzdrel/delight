# frozen_string_literal: true

require "spec_helper"

module Delight
  module Enumerator
    RSpec.describe SoleBy do
      using Enumerator

      describe "#sole_by" do
        it "fails when multiple elements are found" do
          stub = Struct.new(:name, :age)

          data = [
            stub.new("John", 30),
            stub.new("Jane", 25),
            stub.new("Alice", 30),
            stub.new("Doe", 40),
          ]

          expect { data.sole_by(age: 30) }
            .to raise_error Error::SoleItemExpected
        end

        it "fails on invalid method name" do
          stub = Struct.new(:name, :age)

          data = [
            stub.new("John", 30),
            stub.new("Doe", 40),
          ]

          expect { data.sole_by(lastname: 30) }
            .to raise_error NoMethodError, /undefined method/
        end

        it "fails when no element is found" do
          stub = Struct.new(:name, :age)

          data = [
            stub.new("John", 30),
            stub.new("Doe", 40),
          ]

          expect { data.sole_by(age: 50) }
            .to raise_error Error::ElementNotFound
        end

        it "matches on all passed fields" do
          stub = Struct.new(:name, :age)

          data = [
            stub.new("John", 30),
            stub.new("Doe", 30),
          ]

          expect(data.sole_by(age: 30, name: "John"))
            .to eq(stub.new("John", 30))
        end
      end
    end
  end
end
