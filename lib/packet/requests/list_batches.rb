module Fog
  module Compute
    class Packet
      # Real
      class Real
        def list_batches(project_id)
          request(
            :expects => [200],
            :method => "GET",
            :path => "/projects/" + project_id + "/batches"
          )
        end
      end

      # Mock
      class Mock
        def list_batches(_project_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "batches" => [
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
