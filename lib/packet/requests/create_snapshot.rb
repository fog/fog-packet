module Fog
  module Compute
    class Packet
      # Real
      class Real
        def create_snapshot(storage_id)
          request(
            :expects => [202],
            :method => "POST",
            :path => "/storage/" + storage_id + "/snapshots"
          )
        end
      end

      # Mock
      class Mock
        def create_snapshot(_storage_id)
          response = Excon::Response.new
          response.status = 202

          response
        end
      end
    end
  end
end
