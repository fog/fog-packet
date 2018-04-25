require_relative "../../test_helper.rb"

# TestVirtualNetworks
class TestVirtualNetworks < Minitest::Test
  def self.test_order
    :alpha
  end
  
  def setup
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
    @project_id = "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"

    device = @compute.devices.create(:project_id => @project_id, :facility => "ewr1", :plan => "baremetal_0", :hostname => "test01", :operating_system => "coreos_stable")
    @device_id = device.id

    unless Fog.mock?
      device.wait_for { ready? }
    end
  end

  def test_a_create_virtual_network
    response = @compute.virtual_networks.create(:project_id => @project_id, :description => "test", :facility => "ewr1", :vlan => 1, :vxlan => 1)

    assert_equal "test", response.description

    @@virtual_network = response
  end

  def test_b_list_virtual_networks
    response = @compute.virtual_networks.all(@project_id)

    assert !response.empty?
  end

  def test_d_bond_ports
    response = @@virtual_network.bond(true)
    assert_equal true, response
  end

  def test_e_disbond_ports
    response = @@virtual_network.disbond(true)
    assert_equal true, response
  end

  def test_f_assign_port
    eth1 = ""
    device = @compute.devices.get(@device_id)
    device.provisioning_events.each do |port|
      next unless port["network_ports"]
      port["network_ports"].each do |np|
        eth1 = np["id"] if np["name"] == "eth1"
      end
    end
    response = @@virtual_network.assign_port(eth1)

    assert_equal true, response
  end

  def test_g_unassign_port
    eth1 = ""
    device = @compute.devices.get(@device_id)
    device.provisioning_events.each do |port|
      next unless port["network_ports"]
      port["network_ports"].each do |np|
        eth1 = np["id"] if np["name"] == "eth1"
      end
    end
    response = @@virtual_network.unassign_port(eth1)

    assert_equal true, response
  end

  def test_h_delete_virtual_network
    response = @@virtual_network.destroy

    assert_equal true, response
  end

  def test_i_cleanup
    device = @compute.devices.get(@device_id)
    device.destroy
  end
end
