module Fog
  module Compute
    class Packet
      class Real
        def delete_snapshot(storage_id, snapshot_id)
          p '/storage/' + storage_id + '/snapshots/' + snapshot_id
          request(
            expects: [204],
            method: 'DELETE',
            path: '/storage/' + storage_id + '/snapshots/' + snapshot_id,
            # body: Fog::JSON.encode(snapshot)
          )
        end
      end

      class Mock
        def delete_snapshot(storage_id, snapshot_id)
          response = Excon::Response.new
          response.status = 204

          response
        end
      end
    end
  end
end
