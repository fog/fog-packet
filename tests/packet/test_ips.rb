require_relative '../../lib/fog-packet'
require 'minitest/autorun'

Fog.mock!

class TestDevices < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    @compute = Fog::Compute::Packet.new(packet_token: ENV['PACKET_TOKEN'])
    @project_id = '93125c2a-8b78-4d4f-a3c4-7367d6b7cca8'

    options = {
      hostname: 'test01',
      facility: 'ewr1',
      plan: 'baremetal_0',
      operating_system: 'coreos_stable'
    }

    response = @compute.create_device(@project_id, options)

    @@device_id = response.body['id']
    loop do
      response = @compute.get_device(@@device_id)
      break if response.body['state'] == 'active'
      sleep(3)
    end
    @@device_id = response.body['id']
  end

  def test_a_reserve_ip
    options = {
      facility: 'ewr1',
      quantity: 2,
      type: 'global_ipv4',
      comments: 'test comment'
    }

    response = @compute.reserve_ip(@project_id, options)
    @@address = response.body['address']
    @@ip_id = response.body['id']

    assert_equal 201, response.status
  end

  def test_b_get_ips
    response = @compute.list_ips(@project_id)
    response.body['ip_addresses'].length
    assert !response.body['ip_addresses'].empty?
  end

  def test_c_assign_ip
    options = {
      address: @@address
    }

    response = @compute.assign_ip(@@device_id, options)

    p response.status
    p response.body
    assert_equal 201, response.status
  end

  def test_d_unassign_ip
    response = @compute.unassign_ip(@@ip_id)

    p response.status
    p response.body
    assert_equal 204, response.status

  end
end
