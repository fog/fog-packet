require_relative '../../lib/fog-packet'
require 'minitest/autorun'

Fog.mock!

class TestProjects < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(packet_token: ENV['PACKET_TOKEN'])
  end

  def test_list_projects
    # Perform Request
    response = @compute.list_projects

    # Assertions
    assert !response.body['projects'].empty?
  end

  def test_create_volume
    options = {
        facility: 'ewr1',
        plan: 'storage_1',
        size: 20,
        description: 'test description',
        billing_cycle: 'hourly'
    }

    project_id = '93125c2a-8b78-4d4f-a3c4-7367d6b7cca8'

    response = @compute.create_volume(project_id, options)


    assert_equal response.status, 201
    @@volume_id = response.body['id']

    unless Fog.mock!
      loop do
        response = @compute.get_volume(@@volume_id)
        break if response.body['state'] == 'active'
        sleep(3)
      end
    end
  end

  def test_get_volume
    response = @compute.get_volume(@@volume_id)

    assert_equal response.status, 200
    assert_equal response.body['id'], @@volume_id
  end

  def test_list_volumes
    project_id = '93125c2a-8b78-4d4f-a3c4-7367d6b7cca8'
    response = @compute.list_volumes(project_id)

    assert !response.body['volumes'].empty?
  end

  def test_delete_volume
    response = @compute.delete_volume(@@volume_id)
    assert_equal response.status, 204
  end
end
