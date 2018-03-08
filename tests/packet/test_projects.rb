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

  def test_create_project

    options = {
      name: 'test_jg'
    }

    # Perform Request
    response = @compute.create_project(options)

    @@project_id = response.body['id']
    # Assertions
    assert_equal response.status, 201
  end

  def test_get_project
    response = @compute.get_project(@@project_id)

    assert_equal response.status, 200
    assert_equal response.body['id'], @@project_id
  end
end