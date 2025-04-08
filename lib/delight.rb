# frozen_string_literal: true

require_relative "delight/version"

module Delight
end

require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.setup
loader.eager_load
