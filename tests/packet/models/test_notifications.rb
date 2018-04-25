require_relative "../../test_helper.rb"

# TestProjects
class TestProjects < Minitest::Test
  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
  end

  def test_a_list_notifications
    # Perform Request
    response = @compute.notifications.all

    # Assertions
    assert !response.empty?

    @@notification_id = response[0].id
  end

  def test_b_get_notification
    # Perform Request
    response = @compute.notifications.get(@@notification_id)

    # Assertions
    assert_equal @@notification_id, response.id
  end

  def test_c_update_notification
    notification = @compute.notifications.get(@@notification_id)

    response = notification.update
    assert_equal @@notification_id, response.id
    assert_equal true, response.read
  end
end
