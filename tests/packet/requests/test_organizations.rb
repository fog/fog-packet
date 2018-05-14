require_relative "../../test_helper.rb"

# TestOrganizations
class TestOrganizations < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
  end

  def test_request_a_create_organization
    options = {
      :name => "test_org",
      :description => "test organization"
    }

    # Perform Request
    response = @compute.create_organization(options)

    # Assertions
    assert_equal response.status, 201
    @@org_id = response.body["id"]
  end

  def test_request_b_update_organization
    # Perform Request
    options = {
      :name => "test_org_updated",
      :description => "test organization updated"
    }

    response = @compute.update_organization(@@org_id, options)

    # Assertions
    assert_equal 200, response.status
    assert_equal @@org_id, response.body["id"]
    assert_equal options[:name], response.body["name"]
    assert_equal options[:description], response.body["description"]
  end

  def test_request_c_list_organizations
    # Perform Request
    response = @compute.list_organizations

    # Assertions
    assert !response.body["organizations"].empty?
  end

  def test_request_d_get_organization
    response = @compute.get_organization(@@org_id)

    assert_equal 200, response.status
    assert_equal @@org_id, response.body["id"]
  end

  def test_request_z_delete_organization
    response = @compute.delete_organization(@@org_id)

    assert_equal 204, response.status
  end
end
