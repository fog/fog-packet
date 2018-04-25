require_relative "../../test_helper.rb"

# TestSnapshots
class TestSnapshots < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
    @project_id = "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
    options = {
      :facility => "ewr1",
      :plan => "storage_1",
      :size => 20,
      :description => "test description",
      :billing_cycle => "hourly"
    }

    response = @compute.create_volume(@project_id, options)

    @@volume_id = response.body["id"]

    unless Fog.mock?
      loop do
        sleep(3)
        response = @compute.get_volume(@@volume_id)
        break if response.body["state"] == "active"
      end
    end
  end

  def test_request_a_create_snapshot
    response = @compute.create_snapshot(@@volume_id)

    assert_equal 202, response.status
  end

  def test_request_b_list_snapshots
    response = @compute.list_snapshots(@@volume_id)

    assert_equal 200, response.status
    assert !response.body["snapshots"].empty?
    @@snapshot_id = response.body["snapshots"][0]["id"]
  end

  def test_request_c_delete_snapshot
    response = @compute.delete_snapshot(@@volume_id, @@snapshot_id)

    assert_equal 204, response.status
  end

  def test_request_e_cleanup
    @compute.delete_volume(@@volume_id)
  end
end
