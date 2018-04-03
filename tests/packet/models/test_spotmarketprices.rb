require_relative "../../../lib/fog-packet"
require "minitest/autorun"

Fog.mock!

# TestProjects
class TestSpotMarketPrices < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
  end

  def test_list_spotmarketprices
    # Perform Request
    response = @compute.spot_market_prices.all

    assert response
  end

  def test_list_spotmarketprices_history
    # Perform Request
    response = @compute.spot_market_prices.get("ewr1", "baremetal_0")

    assert response
    assert !response.prices_history.empty?
  end
end
