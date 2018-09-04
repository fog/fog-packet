require_relative "../../test_helper.rb"

# TestDevices
class TestDevices < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
    @project_id = "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
  end

  def test_a_create_server
    server = @compute.servers.create(:project_id => @project_id, :facility => "ewr1", :plan => "baremetal_0", :hostname => "test01", :operating_system => "coreos_stable")

    assert_equal "test01", server.hostname

    @@server_id = server.id

    Fog.timeout = 1200
    server.wait_for { ready? }
  end

  def test_b_list_servers
    servers = @compute.servers.all(@project_id, :per_page => 1, :page => 1, :include => "project")

    assert !servers.empty?
  end

  def test_c_get_device
    server = @compute.servers.get(@@server_id)

    assert_equal @@server_id, server.id
  end

  def test_d_update_device
    server = @compute.servers.get(@@server_id)
    server.hostname = "test02"
    server.update

    assert_equal "test02", server.hostname
  end

  def test_e_reboot_server
    server = @compute.servers.get(@@server_id)
    response = server.reboot

    assert_equal true, response

    server.wait_for { ready? }
  end

  def test_f_poweroff_server
    server = @compute.servers.get(@@server_id)

    response = server.stop
    assert_equal true, response

    server.wait_for { inactive? } unless Fog.mock?
  end

  def test_g_poweron_server
    sleep(30) unless Fog.mock?

    server = @compute.servers.get(@@server_id)

    response = server.start

    assert_equal true, response

    server.wait_for { ready? } unless Fog.mock?
  end

  def test_h_get_events
    events = @compute.events.all(@@server_id)

    assert !events.empty?
  end

  def test_i_get_bandwidth
    response = @compute.bandwidth.get(@@server_id, :to => "12-12-2017", :from => "11-11-2017")

    assert_equal 200, response.status
  end

  def test_z_delete_device
    server = @compute.servers.get(@@server_id)
    result = server.destroy
    assert_equal true, result
  end
end
