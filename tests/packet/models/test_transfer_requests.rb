require_relative "../../test_helper.rb"

# TestInvitations
class TestInvitations < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
    @org_id = "602c17ec-f996-4d94-a6a8-20d6356e6c2a"
    @project_id = "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
  end

  def test_request_a_transfer_project
    response = @compute.transfer_requests.transfer(@project_id, @org_id)

    assert response
    @@transfer_request_id = response.id
  end

  def test_request_b_list_transfer_requests
    response = @compute.transfer_requests.all(@org_id)

    assert !response.empty?
  end

  def test_request_c_get_transfer_request
    response = @compute.transfer_requests.get(@@transfer_request_id)

    assert_equal @@transfer_request_id, response.id
  end

  def test_request_d_accept_transfer_request
    transfer_req = @compute.transfer_requests.get(@@transfer_request_id)

    response = transfer_req.accept

    assert_equal true, response
  end

  def test_request_e_decline_transfer_request
    transfer_req = @compute.transfer_requests.get(@@transfer_request_id)

    response = transfer_req.decline

    assert_equal true, response
  end
end
