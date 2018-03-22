module Fog
  module Compute
    class Packet
      # Real
      class Real
        def delete_snapshot(storage_id, snapshot_id)
          request(
            :expects => [204],
            :method => "DELETE",
            :path => "/storage/" + storage_id + "/snapshots/" + snapshot_id
          )
        end
      end

      # Mock
      class Mock
        def delete_snapshot(_storage_id, _snapshot_id)
          response = Excon::Response.new
          response.status = 204

          response
        end
      end
    end
  end
end
