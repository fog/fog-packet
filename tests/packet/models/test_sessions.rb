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

  def test_a_list_sessions
    # Perform Request
    response = @compute.sessions.all

    # Assertions
    assert !response.empty?
  end

  def test_b_session_login
    response = @compute.sessions.login(:username => "username",:password => "password")

    assert_equal true, response
  end

  def test_c_delete_session
    # Perform Request
    response = @compute.sessions.delete
    # Assertions
    assert_equal true, response
  end
end
