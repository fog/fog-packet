module Fog
  module Compute
    class Packet
      class Real
        def list_devices(project_id)
          request(
            expects: [200],
            method: "GET",
            path:  "/projects/#{project_id}/devices"
          )
        end
      end

      class Mock
        def list_devices(project_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "devices" => [
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
