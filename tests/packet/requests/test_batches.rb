require_relative "../../test_helper.rb"

# TestBatches
class TestBatches < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])

    @project_id = "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
  end

  def test_request_a_create_batch
    options = [{
      "hostname" => "test1",
      "description" => "test batch",
      "plan" => "baremetal_0",
      "operating_system" => "coreos_stable",
      "facility" => "ewr1",
      "billing_cycle" => "hourly",
      "tags" => ["abc"],
      "quantity" => 1
    }]

    response = @compute.create_batch(@project_id, options)

    assert_equal 201, response.status

    @@batch_id = response.body["batches"][0]["id"]
  end

  def test_request_b_get_batch
    response = @compute.get_batch(@@batch_id)

    assert_equal @@batch_id, response.body["id"]
  end

  def test_request_c_list_batches
    response = @compute.list_batches(@project_id)

    assert !response.body["batches"].empty?
  end
end
