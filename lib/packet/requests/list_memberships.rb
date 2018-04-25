module Fog
  module Compute
    class Packet
      # Real
      class Real
        def list_memberships(project_id)
          request(
            :expects => [200],
            :method => "GET",
            :path => "/projects/" + project_id + "/memberships"
          )
        end
      end

      # Mock
      class Mock
        def list_memberships(_project_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "memberships" => [
              {
                "id" => "string",
                "roles" => [
                  "string"
                ],
                "created_at" => "string",
                "updated_at" => "string",
                "project" => {
                  "href" => "string"
                },
                "user" => {
                  "href" => "string"
                },
                "href" => "string"
              }
            ]
          }
          response
        end
      end
    end
  end
end
