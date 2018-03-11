module Fog
  module Compute
    class Packet
      class Real
        def list_ips(project_id)
          request(
            expects: [200],
            method: 'GET',
            path: '/projects/' + project_id + '/ips'
          )
        end
      end

      class Mock
        def list_ips(project_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            'ip_addresses' => [
              {
                'id' => '11efb411-c76b-47d8-ba75-20a51c6b0505',
                'address_family' => 6,
                'netmask' => 'ffff:ffff:ffff:ff00:0000:0000:0000:0000',
                'created_at' => '2018-03-06T12:36:06Z',
                'public' => true,
                'cidr' => 56,
                'management' => false,
                'manageable' => true,
                'enabled' => true,
                'addon' => false,
                'bill' => false,
                'project' => {
                  'href' => '/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8'
                },
                'project_lite' => {
                  'href' => '/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8'
                },
                'assignments' => [],
                'facility' => {
                  'id' => 'e1e9c52e-a0bc-4117-b996-0fc94843ea09',
                  'name' => 'Parsippany, NJ',
                  'code' => 'ewr1',
                  'features' => %w[baremetal storage backend_transfers layer_2],
                  'address' => nil,
                  'ip_ranges' => [
                    '2604:1380::/36'
                  ]
                },
                'network' => '2604:1380:0:8900::',
                'address' => '2604:1380:0:8900::2',
                'gateway' => '2604:1380:0:8900::1',
                'available' => '/ips/11efb411-c76b-47d8-ba75-20a51c6b0505/available',
                'href' => '/ips/11efb411-c76b-47d8-ba75-20a51c6b0505'
              }
            ]
          }
          response
        end
      end
    end
  end
end
