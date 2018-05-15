require_relative "../../test_helper.rb"

# TestBGPSessions
class TestBGPSessions < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
    @project_id = "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
  end

  def test_request_a_create_bgp_session
    dev = {
      :hostname => "test01",
      :facility => "ewr1",
      :plan => "baremetal_0",
      :operating_system => "coreos_stable"
    }

    response = @compute.create_device(@project_id, dev)

    @@device_id = response.body["id"]
    loop do
      response = @compute.get_device(@@device_id)
      break if response.body["state"] == "active"
      sleep(3)
    end

    # Perform Request
    address_family = "ipv4"
    response = @compute.create_bgp_session(@@device_id, address_family)

    # Assertions
    assert_equal 201, response.status
    assert_equal address_family, response.body["address_family"]

    @@session_id = response.body["id"]
  end

  def test_request_b_get_bgp_session
    response = @compute.get_bgp_session(@@session_id)

    assert_equal @@session_id, response.body["id"]
  end

  def test_request_d_get_bgp_sessions
    response = @compute.list_bgp_sessions(@@device_id)

    assert !response.body["bgp_sessions"].empty?
  end

  def test_request_e_delete_bgp_session
    response = @compute.delete_bgp_session(@@session_id)

    assert_equal 204, response.status
  end

  def test_request_z_cleanup
    @compute.delete_device(@@device_id)
  end
end
