require_relative "../../test_helper.rb"

# TestMemberships
class TestMemberships < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
    @project_id = "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
  end

  def test_request_a_list_memberships
    response = @compute.list_memberships(@project_id)

    assert_equal 200, response.status
    @@membership_id = response.body["memberships"][0]["id"]
  end

  def test_request_b_get_membership
    response = @compute.get_membership(@@membership_id)

    assert_equal @@membership_id, response.body["id"]
  end

  def test_request_c_update_membership
    options = {
      :roles => ["test02"]
    }

    response = @compute.update_membership(@@membership_id, options)

    assert_equal 200, response.status
    assert_equal @@membership_id, response.body["id"]
  end

  def test_request_d_delete_membership
    response = @compute.delete_membership(@@membership_id)

    assert_equal 204, response.status
  end
end
