require_relative "../../../lib/fog-packet"
require "minitest/autorun"

Fog.mock!

# TestVirtualNetworks
class TestVirtualNetworks < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
    @project_id = "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"

    options = {
      :hostname => "test01",
      :facility => "ewr1",
      :plan => "baremetal_0",
      :operating_system => "coreos_stable"
    }

    response = @compute.create_device(@project_id, options)

    @device = response.body
    loop do
      response = @compute.get_device(@device["id"])
      break if response.body["state"] == "active"
      sleep(3)
    end
  end

  def test_a_create_virtual_network
    options = {
      :project_id => @project_id,
      :description => "test",
      :facility => "ewr1",
      :vlan => 1,
      :vxlan => 1
    }
    response = @compute.create_virtual_network(options)

    assert_equal 201, response.status
    assert_equal options[:description], response.body["description"]

    @virtual_network_id = response.body["id"]
  end

  def test_b_list_virtual_networks
    response = @compute.list_virtual_networks(@project_id)

    assert_equal 200, response.status
    assert !response.body["virtual_networks"].empty?
  end

  def test_d_bond_ports
    response = @compute.bond_ports(@virtual_network_id, true)
    assert_equal 200, response.status
  end

  def test_e_disbond_ports
    response = @compute.disbond_ports(@virtual_network_id, true)
    assert_equal 200, response.status
  end

  def test_f_assign_port
    eth1 = ""
    @device["provisioning_events"].each do |port|
      next unless port["network_ports"]
      port["network_ports"].each do |np|
        eth1 = np["id"] if np["name"] == "eth1"
      end
    end
    response = @compute.assign_port(eth1, @virtual_network_id)

    assert_equal 200, response.status
  end

  def test_g_unassign_port
    eth1 = ""

    @device["provisioning_events"].each do |port|
      next unless port["network_ports"]
      port["network_ports"].each do |np|
        eth1 = np["id"] if np["name"] == "eth1"
      end
    end
    response = @compute.unassign_port(eth1, @virtual_network_id)

    assert_equal 200, response.status
  end

  def test_h_delete_virtual_network
    response = @compute.delete_virtual_network(@virtual_network_id)

    assert_equal 204, response.status
  end

  def test_i_cleanup
    @compute.delete_device(@device["id"])
  end
end
