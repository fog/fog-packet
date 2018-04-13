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
    response = @compute.list_spotmarketprices

    # Assertions
    assert !response.body["spot_market_prices"].empty?
  end

  def test_list_spotmarketprices_history
    # Perform Request
    response = @compute.list_spotmarketprices_history("ewr1", "baremetal_0")

    # Assertions
    assert !response.body["prices_history"].empty?
  end
end
