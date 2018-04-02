require_relative "../../../lib/fog-packet"
require "minitest/autorun"

Fog.mock!
# TestProjects
class TestVpns < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
  end

  def test_a_enable_vpn
    # Perform Request
    response = @compute.vpns.enable

    # Assertions
    assert_equal true, response
  end

  def test_b_get_vpn
    # Perform Request
    response = @compute.vpns.get("nrt1")

    # Assertions
    assert response.config
  end

  def test_c_disable_vpn
    # Perform Request
    response = @compute.vpns.disable

    # Assertions
    assert_equal true, response
  end
end
