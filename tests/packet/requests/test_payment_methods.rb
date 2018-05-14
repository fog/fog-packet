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
      :nonce => "12"
    }

    response = @compute.create_payment_method(@org_id, options)

    assert_equal 201, response.status
    @@payment_method_id = response.body["id"]
  end

  def test_b_request_list_payment_methods
    response = @compute.list_payment_methods(@org_id)

    assert !response.body["payment_methods"].empty?
  end

  def test_c_request_list_payment_methods
    response = @compute.get_payment_method(@@payment_method_id)

    assert_equal 200, response.status
  end

  def test_d_request_update_payment_methods
    options = {
      :name => "test_updated",
      :expiration_month => 12,
      :expiration_year => 2022
    }

    response = @compute.update_payment_method(@@payment_method_id, options)

    assert_equal 200, response.status
    assert_equal options[:name], response.body["name"]
    assert_equal options[:expiration_month], response.body["expiration_month"]
    assert_equal options[:expiration_year], response.body["expiration_year"]
  end

  def test_e_request_delete_payment_method
    response = @compute.delete_payment_method(@@payment_method_id)

    assert_equal 204, response.status
  end
end
