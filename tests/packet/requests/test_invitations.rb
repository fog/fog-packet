require_relative "../../test_helper.rb"

# TestInvitations
class TestInvitations < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
    @project_id = "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
  end

  def test_request_a_list_invitations
    response = @compute.list_invitations(@project_id)

    assert_equal 200, response.status
    @@invite_id = response.body["invitations"][0]["id"]
  end

  def test_request_b_get_invitation
    response = @compute.get_invitation(@@invite_id)

    assert_equal @@invite_id, response.body["id"]
  end

  def test_request_c_accept_invitation
    response = @compute.accept_invitation(@@invite_id)

    assert_equal 200, response.status
    assert_equal @@invite_id, response.body["id"]
  end

  def test_request_d_decline_invitation
    response = @compute.decline_invitation(@@invite_id)

    assert_equal 204, response.status
    assert_equal @@invite_id, response.body["id"]
  end
end
