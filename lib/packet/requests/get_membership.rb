module Fog
  module Compute
    class Packet
      # Real
      class Real
        def get_membership(id)
          request(
            :expects => [200],
            :method => "GET",
            :path => "/memberships/" + id
          )
        end
      end

      # Mock
      class Mock
        def get_membership(_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
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
          response
        end
      end
    end
  end
end
