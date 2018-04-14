require_relative "../../../lib/fog-packet"
require "minitest/autorun"

Fog.mock!

# TestEmailVerification
class TestEmailVerification < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
  end

  def test_request_email_verification
    response = @compute.request_email_verification("jdoe@example.net")

    assert_equal 201, response.status
  end

  def test_verify_email
    response = @compute.verify_email("token1234!")

    assert_equal 200, response.status
  end
end
