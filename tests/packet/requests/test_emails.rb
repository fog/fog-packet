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
    options = {
      :address => "jdoe@example.net",
      :default => "false"
    }

    # Perform Request
    response = @compute.create_email(options)

    @@email_id = response.body["id"]

    # Assertions
    assert_equal response.status, 201
  end

  def test_b_get_email
    response = @compute.get_email(@@email_id)

    assert_equal response.status, 200
    assert_equal @@email_id, response.body["id"]
  end

  def test_c_update_email
    options = {
      :default => false
    }
    response = @compute.update_email(@@email_id, options)

    assert_equal response.status, 200
    assert_equal @@email_id, response.body["id"]
  end

  def test_e_delete_email
    response = @compute.delete_email(@@email_id)

    assert_equal response.status, 204
  end
end
