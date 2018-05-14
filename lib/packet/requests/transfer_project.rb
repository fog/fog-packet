module Fog
  module Compute
    class Packet
      # Real
      class Real
        def transfer_project(project_id, organization_id)
          transfer_request = {
            "target_organization_id" => organization_id
          }

          request(
            :expects => [201],
            :method => "POST",
            :path => "/projects/" + project_id + "/transfers",
            :body => Fog::JSON.encode(transfer_request)
          )
        end
      end

      # Mock
      class Mock
        def transfer_project(_project_id, _organization_id)
          response = Excon::Response.new
          response.status = 201
          response.body = {
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

          response
        end
      end
    end
  end
end
