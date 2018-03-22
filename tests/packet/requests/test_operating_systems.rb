require_relative "../../../lib/fog-packet"
require "minitest/autorun"

Fog.mock!

# TestFacilities
class TestOperatingSystems < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
  end

  def test_list_facilities
    response = @compute.list_operating_systems

    assert !response.body["operating_systems"].empty?
  end
end
