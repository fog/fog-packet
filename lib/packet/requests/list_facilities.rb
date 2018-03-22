module Fog
  module Compute
    class Packet
      # Real
      class Real
        def list_facilities
          request(
            :expects => [200],
            :method => "GET",
            :path => "/facilities"
          )
        end

        def get_project_facilities(project_id)
          request(
            :expects => [200],
            :method => "GET",
            :path => "/projects/" + project_id + "/facilities"
          )
        end
      end

      # Mock
      class Mock
        def list_facilities
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "facilities" => [
              {
                "id" => "fd8c403f-c81d-4de7-ba5e-91362fc2d71c",
                "name" => "Singapore",
                "code" => "sin1",
                "features" => %w[baremetal layer_2],
                "address" => {
                  "href" => "#75006fc8-b6f4-4dd5-a89f-262b9a18e6cd"
                },
                "ip_ranges" => []
              }, {
                "id" => "14a4cad8-6f81-41b6-8cba-aaf8322910af",
                "name" => "Atlanta, GA",
                "code" => "atl1",
                "features" => %w[baremetal layer_2],
                "address" => {
                  "href" => "#efe47e28-626d-4fa6-b8be-786d16e91b59"
                },
                "ip_ranges" => []
              }
            ]
          }

          response
        end
      end
    end
  end
end
