require "minitest/autorun"
require_relative "../lib/fog-packet"

Fog.mock! if ENV["FOG_MOCK"] == "true"
