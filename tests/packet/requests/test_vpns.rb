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
    response = @compute.enable_vpn

    # Assertions
    assert_equal 201, response.status
  end

  def test_b_get_vpn
    # Perform Request
    response = @compute.get_vpn("ewr1")

    # Assertions
    assert_equal 200, response.status
    assert response.body["config"]
  end

  def test_c_disable_vpn
    # Perform Request
    response = @compute.disable_vpn

    # Assertions
    assert_equal 204, response.status
  end
end
