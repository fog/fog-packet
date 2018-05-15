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

  def test_a_list_memberships
    response = @compute.memberships.all(@project_id)

    assert !response.empty?
    @@membership_id = response[0].id
  end

  def test_b_get_membership
    response = @compute.memberships.get(@@membership_id)

    assert_equal @@membership_id, response.id
  end

  def test_c_update_membership
    membership = @compute.memberships.get(@@membership_id)

    membership.roles = ["test02"]
    response = membership.update
    assert_equal @@membership_id, response.id
  end

  def test_d_delete_membership
    membership = @compute.memberships.get(@@membership_id)
    response = membership.destroy

    assert_equal true, response
  end
end
