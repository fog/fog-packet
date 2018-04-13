require_relative "../../../lib/fog-packet"
require "minitest/autorun"

Fog.mock!
# TestNotifications
class TestNotifications < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
  end

  def test_a_list_notifications
    # Perform Request
    response = @compute.list_notifications

    # Assertions
    assert !response.body["notifications"].empty?

    @@notification_id = response.body["notifications"][0]["id"]
  end

  def test_b_get_notification
    # Perform Request
    response = @compute.get_notification(@@notification_id)

    # Assertions
    assert_equal response.status, 200
    assert_equal @@notification_id, response.body["id"]
  end

  def test_c_update_notification
    response = @compute.update_notification(@@notification_id)

    assert_equal 200, response.status
    assert_equal @@notification_id, response.body["id"]
    assert_equal true, response.body["read"]
  end
end
