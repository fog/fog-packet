require_relative "../../../lib/fog-packet"
require "minitest/autorun"

Fog.mock!

# TestDevices
class TestDevices < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])

    @project_id = "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
  end

  def test_a_create_license
    license = {
      :project_id => @@project_id, 
      :description => "test01", 
      :size => "1",
      :license_product_id => "blah"
    }

    license = @compute.licenses.create(license)

    assert license
    @@license_id = license.id
  end

  def test_b_list_licenses
    response = @compute.licenses.all(@project_id)

    assert !response.empty?
  end

  def test_c_get_license
    response = @compute.licenses.get(@@license_id)

    assert_equal @@license_id, response.id
  end

  def test_d_update_license
    license = @compute.licenses.get(@@license_id)
    license.description = "test02"

    updated = license.update

    assert_equal "test02", updated.description
  end

  def test_e_delete_license
    license = @compute.licenses.get(@@license_id)

    response = license.destroy
    assert_equal true, response
  end
end
