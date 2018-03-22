module Fog
  module Compute
    class Packet
      # Real
      class Real
        def create_virtual_network(options)
          vnet = {
            "project_id" => options[:project_id],
            "description" => options[:description],
            "facility" => options[:facility],
            "vxlan" => options[:vxlan],
            "vlan" => options[:vlan]
          }

          request(
            :expects => [201],
            :method => "POST",
            :path => "/projects/" + options[:project_id] + "/virtual-networks",
            :body => Fog::JSON.encode(vnet)
          )
        end
      end

      # Mock
      class Mock
        def create_virtual_network(options)
          response = Excon::Response.new
          response.status = 201
          response.body = {
            "id" => "fce3b27f-dc07-4eb6-9aeb-de4381f045ae",
            "description" => options[:description],
            "vxlan" => 1026,
            "created_at" => "2018-03-12T21:49:27Z",
            "internet_gateway" => nil,
            "facility" => { "href" => "/facilities/e1e9c52e-a0bc-4117-b996-0fc94843ea09" },
            "instances" => [],
            "assigned_to" => {
              "href" => "/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
            },
            "facility_code" => "ewr1",
            "href" => "/virtual-networks/fce3b27f-dc07-4eb6-9aeb-de4381f045ae"
          }

          response
        end
      end
    end
  end
end
