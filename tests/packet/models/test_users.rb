require_relative "../../test_helper.rb"

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
    response = @compute.users.all

    # Assertions
    assert !response.empty?

    @@user_id = response[0].id
  end

  def test_b_get_current_user
    response = @compute.users.get
    assert response
  end

  def test_c_get_user
    response = @compute.users.get(@@user_id)

    assert response
    assert_equal @@user_id, response.id
  end

  def test_d_update_user
    user = @compute.users.get(@@user_id)

    user.first_name = "Jane"
    user.last_name = "Doe"

    response = user.update

    assert_equal "Jane", response.first_name
    assert_equal "Doe", response.last_name
  end
end
