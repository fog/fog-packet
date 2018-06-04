module Fog
  module Compute
    class Packet
      # Real
      class Real
        def list_transfers(organization_id, params = {})
          request(
            :expects => [200],
            :method => "GET",
            :path => "/organizations/" + organization_id + "/transfers",
            :params => params
          )
        end
      end

      # Mock
      class Mock
        def list_transfer_requests(_organization_id, _params = {})
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "transfers" => [
              {
                "id" => "string",
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
            ]
          }

          response
        end
      end
    end
  end
end
