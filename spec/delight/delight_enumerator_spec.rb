# frozen_string_literal: true

require "spec_helper"

module Delight
  RSpec.describe DelightEnumerator do
    using described_class

    it "provides select_by" do
      expect([].select_by).to eq []
    end

    it "provides select_by_key" do
      expect([].select_by).to eq []
    end

    it "provides detect_by!" do
      expect { [].detect_by! }
        .to raise_error(
          DelightEnumerator::Error::ElementNotFound,
        )
    end

    it "provides detect_by_key!" do
      expect { [].detect_by_key! }
        .to raise_error(
          DelightEnumerator::Error::ElementNotFound,
        )
    end
  end
end
