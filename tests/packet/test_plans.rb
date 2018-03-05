require_relative '../../lib/fog-packet'
require 'minitest/autorun'

Fog.mock!

class TestPlans < Minitest::Test

  def self.test_order
   :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(packet_token: ENV['PACKET_TOKEN'])

  end



  def test_list_plans

    # Perform Request
    response = @compute.list_plans()

    # Assertions
    assert response.body['plans'].length >0

  end

  def test_list_project_plans
    response = @compute.get_project_plans("ttt")
    # Assertions
    assert response.body['plans'].length >0
  end


end