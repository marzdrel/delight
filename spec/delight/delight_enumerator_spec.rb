# frozen_string_literal: true

require "spec_helper"

module Delight
  RSpec.describe DelightEnumerator do
    using described_class

    it "provides select_by" do
      expect([].select_by).to eq []
    end
  end
end
