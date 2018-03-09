require_relative '../../lib/fog-packet'
require 'minitest/autorun'

Fog.mock!

class TestFacilities < Minitest::Test

  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(packet_token: ENV['PACKET_TOKEN'])

  end


  def test_list_plans
    response = @compute.list_facilities()

    assert !response.body['facilities'].empty?

  end

  def test_list_project_facilities
    response = @compute.get_project_facilities("ttt")

    assert !response.body['facilities'].empty?
  end
end