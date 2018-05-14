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
    response = @compute.transfer_project(@project_id, @org_id)

    assert_equal 201, response.status
    @@transfer_request_id = response.body["id"]
  end

  def test_request_b_list_transfer_requests
    response = @compute.list_transfer_requests(@org_id)

    assert_equal 200, response.status
  end

  def test_request_c_get_transfer_request
    response = @compute.get_transfer_request(@@transfer_request_id)

    assert_equal 200, response.status
    assert_equal @@transfer_request_id, response.body["id"]
  end

  def test_request_d_accept_transfer_request
    response = @compute.accept_transfer_request(@@transfer_request_id)

    assert_equal 204, response.status
  end

  def test_request_e_decline_transfer_request
    response = @compute.decline_transfer_request(@@transfer_request_id)

    assert_equal 204, response.status
  end
end
