require_relative "../../../lib/fog-packet"
require "minitest/autorun"

Fog.mock!

# TestProjects
class TestProjects < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
  end

  def test_a_create_project
    # Perform Request
    response = @compute.projects.create(:name => "test01", :payment_method_id => "1234")

    @@project_id = response.id
    # Assertions
    assert_equal "test01", response.name
  end

  def test_b_list_projects
    # Perform Request
    response = @compute.projects.all

    # Assertions
    assert !response.empty?
  end

  def test_c_get_project
    response = @compute.projects.get(@@project_id)
    assert_equal @@project_id, response.id
  end

  def test_d_delete_project
    result = @compute.projects.destroy(@@project_id)

    assert_equal true, result
  end
end
