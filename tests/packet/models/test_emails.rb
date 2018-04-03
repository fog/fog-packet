require_relative "../../../lib/fog-packet"
require "minitest/autorun"

Fog.mock!
# TestEmails
class TestEmails < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
  end

  def test_a_create_email
    # Perform Request
    email = @compute.emails.create(:address => "jdoe@example.net", :default => false)

    # Assertions
    @@email_id = email.id
    assert_equal "jdoe@example.net", email.address
    assert_equal false, email.default
  end

  def test_b_get_email
    response = @compute.emails.get(@@email_id)

    assert_equal @@email_id, response.id
  end

  def test_c_update_email
    email = @compute.emails.get(@@email_id)

    email.default = false
    email.update

    assert_equal @@email_id, email.id
  end

  def test_e_delete_email
    email = @compute.emails.get(@@email_id)

    response = email.destroy
    assert_equal true, response
  end
end
