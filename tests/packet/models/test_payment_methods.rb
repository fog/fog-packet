require_relative "../../test_helper.rb"

# TestPaymentMethods
class TestPaymentMethods < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
    @org_id = "6c17df6c-8769-4d98-b01f-f2848b6489a1"
  end

  def test_a_request_create_payment_method
    options = {
      :name => "test",
      :default => "false",
      :nonce => "12",
      :organization_id => @org_id
    }

    response = @compute.payment_methods.create(options)

    assert response
    @@payment_method_id = response.id
  end

  def test_b_request_list_payment_methods
    response = @compute.payment_methods.all(@org_id)

    assert !response.empty?
  end

  def test_c_request_get_payment_methods
    response = @compute.payment_methods.get(@@payment_method_id)

    assert_equal @@payment_method_id, response.id
  end

  def test_d_request_update_payment_methods
    pm = @compute.payment_methods.get(@@payment_method_id)

    pm.name = "test_updated"
    pm.expiration_month = 12
    pm.expiration_year = 2022
    response = pm.update

    assert_equal @@payment_method_id, response.id
    assert_equal pm.name, response.name
    assert_equal pm.expiration_month, response.expiration_month
    assert_equal pm.expiration_year, response.expiration_year
  end

  def test_e_request_delete_payment_method
    pm = @compute.payment_methods.get(@@payment_method_id)

    response = pm.destroy
    assert_equal true, response
  end
end
