require_relative "../../../lib/fog-packet"
require "minitest/autorun"

Fog.mock!
# TestUsers
class TestUsers < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
  end

  def test_a_list_users
    # Perform Request
    response = @compute.list_users

    # Assertions
    assert !response.body["users"].empty?

    @@user_id = response.body["users"][0]["id"]
  end

  def test_b_get_current_user
    response = @compute.get_user
    assert_equal response.status, 200
  end

  def test_c_get_user
    response = @compute.get_user(@@user_id)

    assert_equal response.status, 200
    assert_equal @@user_id, response.body["id"]
  end

  def test_d_update_user
    options = {
      :first_name => "Jane",
      :last_name => "Doe"
    }

    response = @compute.update_user("2dce124f-3220-495c-907e-5bbbd4dda77c", options)

    assert_equal response.status, 200
    assert_equal options[:first_name], response.body["first_name"]
    assert_equal options[:last_name], response.body["last_name"]
  end
end
