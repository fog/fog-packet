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

  def test_create_batch
    batches = [{
      :hostname => "test1",
      :description => "test batch",
      :plan => "baremetal_0",
      :operating_system => "coreos_stable",
      :facility => "ewr1",
      :billing_cycle => "hourly",
      :tags => ["abc"],
      :quantity => 1
    }]

    response = @compute.batches.create(@project_id, :batches => batches)

    assert !response.empty?

    @@batch_id = response[0].id
  end

  def test_get_batch
    response = @compute.batches.get(@@batch_id)

    assert_equal @@batch_id, response.id
  end

  def test_list_batches
    response = @compute.batches.all(@project_id)

    assert !response.empty?
  end
end
