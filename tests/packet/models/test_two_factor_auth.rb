require_relative "../../test_helper.rb"

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
    response = @compute.two_factor_auth.enable("sms")

    # Assertions
    assert_equal true, response
  end

  def test_c_disable_two_factor_auth
    # Perform Request
    response = @compute.two_factor_auth.disable("sms")

    # Assertions
    assert_equal true, response
  end
end
