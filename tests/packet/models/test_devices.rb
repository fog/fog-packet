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

  def test_a_create_device
    device = @compute.devices.create(:project_id => @project_id, :facility => "ewr1", :plan => "baremetal_0", :hostname => "test01", :operating_system => "coreos_stable")

    assert_equal "test01", device.hostname

    @@device_id = device.id

    Fog.timeout = 1200
    device.wait_for { ready? }
  end

  def test_b_list_device
    devices = @compute.devices.all(@project_id, :per_page => 1, :page => 1, :include => "project")

    assert !devices.empty?
  end

  def test_c_get_device
    device = @compute.devices.get(@@device_id)

    assert_equal @@device_id, device.id
  end

  def test_d_update_device
    device = @compute.devices.get(@@device_id)
    device.hostname = "test02"
    device.update

    assert_equal "test02", device.hostname
  end

  def test_e_reboot_device
    device = @compute.devices.get(@@device_id)
    response = device.reboot

    assert_equal true, response

    device.wait_for { ready? }
  end

  def test_f_poweroff_device
    device = @compute.devices.get(@@device_id)

    response = device.stop
    assert_equal true, response

    device.wait_for { inactive? } unless Fog.mock?
  end

  def test_g_poweron_device
    sleep(30) unless Fog.mock?

    device = @compute.devices.get(@@device_id)

    response = device.start

    assert_equal true, response

    device.wait_for { ready? } unless Fog.mock?
  end

  def test_h_get_events
    events = @compute.events.all(@@device_id)

    assert !events.empty?
  end

  def test_i_get_bandwidth
    response = @compute.bandwidth.get(@@device_id, :to => "12-12-2017", :from => "11-11-2017")

    assert_equal 200, response.status
  end

  def test_z_delete_device
    device = @compute.devices.get(@@device_id)
    result = device.destroy
    assert_equal true, result
  end
end
