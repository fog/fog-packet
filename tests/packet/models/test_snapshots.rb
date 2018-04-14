require_relative "../../../lib/fog-packet"
require "minitest/autorun"

Fog.mock!

# TestSnapshots
class TestSnapshots < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
    @project_id = "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"

    volume = @compute.volumes.create(:project_id => @project_id, :facility => "ewr1", :plan => "storage_1", :size => 20, :description => "test description", :billing_cycle => "hourly")

    @@volume_id = volume.id
    p @@volume_id
    loop do
      sleep(3)
      response = volume.reload
      break if response.state == "active"
    end
  end

  def test_a_create_snapshot
    @compute.snapshots.create(:storage_id => @@volume_id)
    assert_equal true, response
  end

  def test_b_list_snapshots
    response = @compute.snapshots.all(@@volume_id)

    assert !response.empty?
    @@snapshot = response[0]
  end

  def test_c_delete_snapshot
    response = @@snapshot.destroy(@@volume_id)

    assert_equal true, response
  end

  def test_e_cleanup
    p "cleanup"
    volume = @compute.volumes.get(@@volume_id)
    response = volume.destroy
    assert_equal true, response
  end
end
