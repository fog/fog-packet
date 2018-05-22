module Fog
  module Compute
    class Packet
      # Real
      class Real
        def get_transfer_request(id)
          request(
            :expects => [200],
            :method => "GET",
            :path => "/transfers/" + id
          )
        end
      end

      # Mock
      class Mock
        def get_transfer_request(id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "id" => id,
            "created_at" => "string",
            "updated_at" => "string",
            "target_organization" => {
              "href" => "string"
            },
            "project" => {
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
