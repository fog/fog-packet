require_relative "../../test_helper.rb"

# TestPlans
class TestPlans < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
  end

  def test_request_list_plans
    # Perform Request
    response = @compute.list_plans

    # Assertions
    assert !response.body["plans"].empty?
  end
end
