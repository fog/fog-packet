require_relative "../../test_helper.rb"

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
    response = @compute.email_verification.request("jdoe@example.net")

    assert_equal true, response
  end

  def test_verify_email
    response = @compute.email_verification.verify("token1234!")

    assert_equal true, response
  end
end
