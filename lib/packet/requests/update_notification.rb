module Fog
  module Compute
    class Packet
      # Real
      class Real
        def update_notification(id)
          request(
            :expects => [200],
            :method => "PUT",
            :path => "/notifications/" + id
          )
        end
      end

      # Mock
      class Mock
        def update_notification(id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "id" => id,
            "type" => "string",
            "body" => "string",
            "severity" => "string",
            "read" => true,
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
