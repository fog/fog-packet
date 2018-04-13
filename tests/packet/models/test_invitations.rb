require_relative "../../../lib/fog-packet"
require "minitest/autorun"

Fog.mock!

# TestInvitations
class TestInvitations < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])

    @project_id = "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
  end

  def test_a_list_invitations
    p @project_id
    response = @compute.invitations.all(@project_id)

    assert !response.empty?
    @@invite_id = response[0].id
  end

  def test_b_get_invitation
    response = @compute.invitations.get(@invite_id)

    assert_equal @invite_id, response.id
  end

  def test_c_accept_invitation
    invite = @compute.invitations.get(@invite_id)

    response = invite.accept
    assert_equal @invite_id, response.id
  end

  def test_d_decline_invitation
    invite = @compute.invitations.get(@invite_id)

    response = invite.decline
    assert_equal @invite_id, response.id
  end
end
