module Fog
  module Compute
    class Packet
      # Real
      class Real
        def list_bgp_sessions(device_id)
          request(
            :expects => [200],
            :method => "GET",
            :path => "/devices/" + device_id + "/bgp/sessions"
          )
        end
      end

      # Mock
      class Mock
        def list_bgp_sessions(_device_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "bgp_sessions" => [
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
