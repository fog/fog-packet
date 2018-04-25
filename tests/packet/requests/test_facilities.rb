require_relative "../../test_helper.rb"

# TestFacilities
class TestFacilities < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
  end

  def test_request_list_facilities
    response = @compute.list_facilities

    assert !response.body["facilities"].empty?
  end
end
