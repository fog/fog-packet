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
    response = @compute.capacities.all

    assert response
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

    response = @compute.capacities.validate(options)

    assert_equal true, response
  end
end
