module Fog
  module Compute
    class Packet
      # Real
      class Real
        def list_events(device_id)
          request(
            :expects => [200],
            :method => "GET",
            :path => "/devices/" + device_id + "/events"
          )
        end
      end

      # Mock
      class Mock
        def list_events(_device_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "events" => [
              {
              }
            ]
          }

          response
        end
      end
    end
  end
end
