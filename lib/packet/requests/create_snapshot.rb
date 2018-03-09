module Fog
  module Compute
    class Packet
      class Real
        def create_snapshot(storage_id)
          request(
            expects: [202],
            method: 'POST',
            path: '/storage/' + storage_id + '/snapshots',
            # body: Fog::JSON.encode(snapshot)
          )
        end
      end

      class Mock
        def create_snapshot(storage_id)
          response = Excon::Response.new
          response.status = 202

          response
        end
      end
    end
  end
end
