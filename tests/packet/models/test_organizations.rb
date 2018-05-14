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

  def test_a_create_organization
    options = {
      :name => "test_org",
      :description => "test organization"
    }

    # Perform Request
    response = @compute.organizations.create(options)

    # Assertions
    assert response
    @@org_id = response.id
  end

  def test_b_update_organization
    options = {
      :name => "test_org",
      :description => "test organization"
    }
    org = @compute.organizations.get(@@org_id)
    # Perform Request
    org.name = options[:name]
    org.description = options[:description]

    response = org.update

    # Assertions
    assert response
    assert_equal @@org_id, response.id
    assert_equal options[:name], response.name
    assert_equal options[:description], response.description
  end

  def test_c_list_organizations
    # Perform Request
    response = @compute.organizations.all

    # Assertions
    assert !response.empty?
  end

  def test_d_get_organization
    org = @compute.organizations.get(@@org_id)

    assert_equal @@org_id, org.id
  end

  def test_z_delete_organization
    org = @compute.organizations.get(@@org_id)

    response = org.destroy
    assert_equal true, response
  end
end
