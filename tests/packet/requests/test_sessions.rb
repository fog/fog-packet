require_relative "../../test_helper.rb"

# TestSessions
class TestSessions < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
  end

  def test_request_a_list_sessions
    # Perform Request
    response = @compute.list_sessions

    # Assertions
    assert !response.body["sessions"].empty?
  end

  def test_request_b_session_login
    response = @compute.session_login(:username => "username", :password => "password")

    assert_equal 201, response.status
  end

  def test_request_c_delete_session
    # Perform Request
    response = @compute.delete_session
    # Assertions
    assert_equal 204, response.status
  end
end
