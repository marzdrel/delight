# frozen_string_literal: true

require "spec_helper"

module Delight
  RSpec.describe DelightEnumerator::DetectBang do
    using DelightEnumerator

    describe "#detect!" do
      it "selects using a method" do
        data = [1, 2, 8]

        expect(data.detect!(&:even?))
          .to eq 2
      end

      it "fails on no value" do
        data = [1, 3]

        expect { data.detect!(&:even?) }
          .to raise_error described_class::ElementNotFound
      end
    end
  end
end
