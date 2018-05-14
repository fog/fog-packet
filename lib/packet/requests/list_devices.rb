module Fog
  module Compute
    class Packet
      # Real
      class Real
        def list_devices(project_id, params = {})
          request(
            :expects => [200],
            :method => "GET",
            :path => "/projects/" + project_id + "/devices",
            :params => params
          )
        end
      end

      # Mock
      class Mock
        def list_devices(_project_id, params = {})
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
