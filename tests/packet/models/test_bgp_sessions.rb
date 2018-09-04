require_relative "../../test_helper.rb"

# TestBGPSessions
class TestBGPSessions < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
    @project_id = "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
  end

  def test_a_create_bgp_session
    server = @compute.servers.create(:project_id => @project_id, :facility => "ewr1", :plan => "baremetal_0", :hostname => "test01", :operating_system => "coreos_stable")
    @@server_id = server.id

    server.wait_for { ready? }

    # Perform Request
    address_family = "ipv4"
    response = @compute.bgp_sessions.create(:device_id => @@server_id, :address_family => address_family)

    # Assertions
    assert_equal address_family, response.address_family

    @@session_id = response.id
  end

  def test_b_get_bgp_session
    response = @compute.bgp_sessions.get(@@session_id)

    assert_equal @@session_id, response.id
  end

  def test_d_list_bgp_sessions
    response = @compute.bgp_sessions.all(@@server_id)

    assert !response.empty?
  end

  def test_e_delete_bgp_session
    session = @compute.bgp_sessions.get(@@session_id)

    response = session.destroy
    assert_equal true, response
  end

  def test_z_cleanup
    @compute.delete_device(@@server_id)
  end
end
