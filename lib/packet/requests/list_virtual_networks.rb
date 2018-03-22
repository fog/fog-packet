module Fog
  module Compute
    class Packet
      # Real
      class Real
        def list_virtual_networks(project_id)
          request(
            :expects => [200],
            :method => "GET",
            :path => "/projects/" + project_id + "/virtual-networks"
          )
        end
      end

      # Mock
      class Mock
        def list_virtual_networks(_project_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "virtual_networks" => [
              {
                "id" => "699c3c36-0cf6-4552-ad43-a1845c04a838",
                "description" => "test",
                "vxlan" => 1022,
                "created_at" => "2018-03-12T22:16:39Z",
                "internet_gateway" => nil,
                "facility" => {
                  "href" => "/facilities/e1e9c52e-a0bc-4117-b996-0fc94843ea09"
                },
                "instances" => [],
                "assigned_to" => {
                  "href" => "/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
                },
                "facility_code" => "ewr1", "href" => "/virtual-networks/699c3c36-0cf6-4552-ad43-a1845c04a838"
              }, {
                "id" => "ee424aad-539d-4a4a-877e-fbbd1417e235",
                "description" => "test",
                "vxlan" => 1026,
                "created_at" => "2018-03-12T22:29:56Z",
                "internet_gateway" => nil,
                "facility" =>
                    {
                      "href" => "/facilities/e1e9c52e-a0bc-4117-b996-0fc94843ea09"
                    },
                "instances" => [],
                "assigned_to" => {
                  "href" => "/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
                },
                "facility_code" => "ewr1",
                "href" => "/virtual-networks/ee424aad-539d-4a4a-877e-fbbd1417e235"
              }
            ]
          }

          response
        end
      end
    end
  end
end
