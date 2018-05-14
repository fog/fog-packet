require_relative "../../test_helper.rb"

# TestLicenses
class TestLicenses < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])

    @project_id = "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
  end

  def test_request_a_create_license
    options = {
      :description => "test01",
      :size => "1",
      :license_product_id => "baremetal_0"
    }

    response = @compute.create_license(@project_id, options)

    assert_equal 201, response.status
    @@license_id = response.body["id"]
  end

  def test_request_b_list_licenses
    response = @compute.list_licenses(@project_id)

    assert !response.body["licenses"].empty?
  end

  def test_request_c_get_license
    response = @compute.get_license(@@license_id)

    assert_equal @@license_id, response.body["id"]
  end

  def test_request_d_update_license
    options = {
      :description => "test02",
      :size => "1"
    }

    response = @compute.update_license(@@license_id, options)

    assert_equal 200, response.status
  end

  def test_request_e_delete_license
    response = @compute.delete_license(@@license_id)

    assert_equal 204, response.status
  end
end
