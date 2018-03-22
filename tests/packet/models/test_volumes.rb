require_relative "../../../lib/fog-packet"
require "minitest/autorun"

Fog.mock!

# TestVolumes
class TestVolumes < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
    @project_id = "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"

    @@device = @compute.devices.create(:project_id => @project_id, :facility => "ewr1", :plan => "baremetal_0", :hostname => "test01", :operating_system => "coreos_stable")

    loop do
      response = @@device.reload
      break if response.state == "active"
      sleep(3)
    end
    @@device_id = @@device.id
  end

  def test_a_create_volume
    @@volume = @compute.volumes.create(:project_id => @project_id, :facility => "ewr1", :plan => "storage_1", :size => 20, :description => "test description", :billing_cycle => "hourly")

    assert @@volume
    @@volume_id = @@volume.id

    unless Fog.mock!
      loop do
        response = volume.reload
        break if response.state == "active"
        sleep(3)
      end
    end
  end

  def test_b_get_volume
    response = @compute.volumes.get(@@volume_id)

    assert_equal @@volume_id, response.id
  end

  def test_c_update_volume
    @@volume.size = 30

    response = @@volume.update

    assert_equal @@volume.size, response.size
  end

  def test_d_list_volumes
    response = @compute.volumes.all(@project_id)

    assert !response.empty?
  end

  def test_e_attach_volume
    response = @@volume.attach(@device_id)
    @@attachment_id = response.id

    assert response
  end

  def test_f_detach_volume
    response = @@volume.detach

    assert_equal true, response
  end

  def test_g_delete_volume
    response = @@volume.destroy
    assert_equal true, response
  end

  def test_h_cleanup
    @@device.destroy
  end
end
