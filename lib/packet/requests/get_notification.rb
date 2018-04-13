module Fog
  module Compute
    class Packet
      # Real
      class Real
        def get_notification(id)
          request(
            :expects => [200],
            :method => "GET",
            :path => "/notifications/" + id
          )
        end
      end

      # Mock
      class Mock
        def get_notification(id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "id" => id,
            "type" => "string",
            "body" => "string",
            "severity" => "string",
            "read" => false,
            "context" => "string",
            "created_at" => "string",
            "updated_at" => "string",
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
