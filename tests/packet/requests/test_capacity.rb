require_relative "../../test_helper.rb"

# TestCapacity
class TestCapacity < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
  end

  def test_request_get_capacity
    response = @compute.get_capacity

    assert !response.body["capacity"].empty?
  end

  def test_request_validate_capacity
    options = {
      :servers => [
        {
          :facility => "ewr1",
          :plan => "baremetal_2a",
          :quantity => 1
        },
        {
          :facility => "atl1",
          :plan => "baremetal_1e",
          :quantity => 1
        }
      ]
    }

    response = @compute.validate_capacity(options)

    assert_equal 204, response.status
  end
end
