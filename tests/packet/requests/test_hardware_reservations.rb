require_relative "../../test_helper.rb"

# TestHardwareReservations
class TestHardwareReservations < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
    @project_id = "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
  end

  def test_request_a_list_hardware_reservations
    # Perform Request
    response = @compute.list_hardware_reservations(@project_id)

    # Assertions
    assert !response.body["hardware_reservations"].empty?

    @@reservation_id = response.body["hardware_reservations"][0]["id"]
  end

  def test_request_b_get_hardware_reservation
    response = @compute.get_hardware_reservation(@@reservation_id)

    assert_equal 200, response.status
    assert_equal @@reservation_id, response.body["id"]
  end

  def test_request_c_move_hardware_reservation
    # Perform Request
    response = @compute.move_hardware_reservation(@@reservation_id, @project_id)
    # Assertions
    assert_equal 200, response.status
  end
end
