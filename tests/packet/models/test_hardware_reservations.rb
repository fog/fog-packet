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
    response = @compute.hardware_reservations.all(@project_id)

    # Assertions
    assert !response.empty?

    @@reservation_id = response[0].id
  end

  def test_request_b_get_hardware_reservation
    response = @compute.hardware_reservations.get(@@reservation_id)

    assert response
    assert_equal @@reservation_id, response.id
  end

  def test_request_c_move_hardware_reservation
    reservation = @compute.hardware_reservations.get(@@reservation_id)

    response = reservation.move(@project_id)
    assert_equal true, response
  end
end
