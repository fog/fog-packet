require_relative "../../test_helper.rb"

# TestOperatingSystems
class TestOperatingSystems < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
  end

  def test_list_facilities
    response = @compute.operating_systems.all

    assert !response.empty?
  end
end
