require_relative "../../test_helper.rb"

# TestIps
class TestIps < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
    @project_id = "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"

    device = @compute.devices.create(:project_id => @project_id, :facility => "ewr1", :plan => "baremetal_0", :hostname => "test01", :operating_system => "coreos_stable")

    device.wait_for { ready? }
  end

  def test_a_reserve_ip
    response = @compute.ips.create(:project_id => @project_id, :facility => "ewr1", :quantity => 2, :type => "global_ipv4", :comments => "test comment")

    @@address = response.address
    @@ip_id = response.id

    # assert_equal 201, response.status
  end

  def test_b_list_ips
    response = @compute.ips.all(@project_id)
    assert !response.empty?
  end

  def test_c_get_ip
    response = @compute.ips.get(@@ip_id)
    assert_equal @@ip_id, response.id
  end

  def test_d_assign
    ip = @compute.ips.get(@@ip_id)
    response = ip.assign(@device_id)

    assert response
  end

  def test_e_unassign_ip
    ip = @compute.ips.get(@@ip_id)
    response = ip.unassign

    assert_equal true, response
  end
end
