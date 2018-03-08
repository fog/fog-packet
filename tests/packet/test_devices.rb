require_relative '../../lib/fog-packet'
require 'minitest/autorun'
# require 'json'

# Fog.mock!

class TestDevices < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    @compute = Fog::Compute::Packet.new(packet_token: ENV['PACKET_TOKEN'])
  end

  def test_create_device
    options = {
      hostname: 'test01',
      facility: 'ewr1',
      plan: 'baremetal_0',
      operating_system: 'coreos_stable'
    }
    project_id = '93125c2a-8b78-4d4f-a3c4-7367d6b7cca8'

    response = @compute.create_device(project_id, options)

    @@device_id = response.body['id']

    assert_equal options[:hostname], response.body['hostname']
    assert_equal options[:facility], response.body['facility']['code']
    assert_equal options[:plan], response.body['plan']['slug']
    assert_equal options[:operating_system], response.body['operating_system']['slug']

    loop do
      response = @compute.get_device(@@device_id)
      break if response.body['state'] == 'active'
      sleep(3)
    end
  end

  def test_get_device
    response = @compute.get_device(@@device_id)

    assert_equal 200, response.status
    assert_equal @@device_id, response.body['id']
  end

  def test_update_device
    options = {
      hostname: 'test02'
    }
    response = @compute.update_device(@@device_id, options)

    assert_equal 200, response.status
    assert_equal options[:hostname], response.body['hostname']
  end

  def test_reboot_device
    response = @compute.reboot_device(@@device_id)

    assert_equal 202, response.status

    unless Fog.mock!
      loop do
        response = @compute.get_device(@@device_id)
        break if response.body['state'] == 'active'
        sleep(3)
      end
    end
  end

  def test_poweroff_device
    response = @compute.poweroff_device(@@device_id)

    assert_equal 202, response.status

    unless Fog.mock!
      loop do
        response = @compute.get_device(@@device_id)
        break if response.body['state'] == 'inactive'
        sleep(3)
      end
    end
  end

  def test_poweron_device
    response = @compute.poweron_device(@@device_id)

    assert_equal 202, response.status

    unless Fog.mock!
      loop do
        response = @compute.get_device(@@device_id)
        break if response.body['state'] == 'active'
        sleep(3)
      end
    end
  end

  def test_delete_device
    response = @compute.delete_device(@@device_id)

    assert_equal 204, response.status
  end
end
