require_relative "../../../lib/fog-packet"
require "minitest/autorun"

Fog.mock!
# TestTwoFactorAuth
class TestTwoFactorAuth < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
  end

  def test_a_enable_two_factor_auth
    # Perform Request
    response = @compute.enable_two_factor_auth("app")

    # Assertions
    assert_equal 200, response.status
  end

  def test_c_disable_two_factor_auth
    # Perform Request
    response = @compute.disable_two_factor_auth("app")

    # Assertions
    assert_equal 204, response.status
  end
end
