# frozen_string_literal: true

require "spec_helper"

module Delight
  module DelightEnumerator
    RSpec.describe DelightEnumerator do
      using DelightEnumerator

      describe "#detect_by" do
        it "selects using a method" do
          stub = Struct.new(:name, :age)

          data = [
            stub.new("John", 30),
            stub.new("Jane", 25),
            stub.new("Alice", 30),
            stub.new("Doe", 40),
          ]

          expect(data.detect_by(age: 30))
            .to eq stub.new("John", 30)
        end

        it "fails on invalid method name" do
          stub = Struct.new(:name, :age)

          data = [
            stub.new("John", 30),
            stub.new("Doe", 40),
          ]

          expect { data.detect_by(lastname: 30) }
            .to raise_error NoMethodError, /undefined method/
        end

        it "returns no value when no match" do
          stub = Struct.new(:name, :age)

          data = [
            stub.new("John", 30),
            stub.new("Doe", 40),
          ]

          expect(data.detect_by(age: 10))
            .to be_nil
        end

        it "matches on all passed fields" do
          stub = Struct.new(:name, :age)

          data = [
            stub.new("John", 30),
            stub.new("Doe", 30),
          ]

          expect(data.detect_by(age: 30, name: "John"))
            .to eq stub.new("John", 30)
        end
      end

      describe "#detect_by!" do
        it "selects using a method" do
          stub = Struct.new(:name, :age)

          data = [
            stub.new("John", 30),
            stub.new("Jane", 25),
            stub.new("Alice", 30),
            stub.new("Doe", 40),
          ]

          expect(data.detect_by!(age: 30))
            .to eq stub.new("John", 30)
        end

        it "fails on invalid method name" do
          stub = Struct.new(:name, :age)

          data = [
            stub.new("John", 30),
            stub.new("Doe", 40),
          ]

          expect { data.detect_by!(lastname: 30) }
            .to raise_error NoMethodError, /undefined method/
        end

        it "returns no value when no match" do
          stub = Struct.new(:name, :age)

          data = [
            stub.new("John", 30),
            stub.new("Doe", 40),
          ]

          expect { data.detect_by!(age: 10) }
            .to raise_error Error::ElementNotFound
        end

        it "matches on all passed fields" do
          stub = Struct.new(:name, :age)

          data = [
            stub.new("John", 30),
            stub.new("Doe", 30),
          ]

          expect(data.detect_by!(age: 30, name: "John"))
            .to eq stub.new("John", 30)
        end
      end
    end
  end
end
