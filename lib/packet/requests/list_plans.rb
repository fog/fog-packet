module Fog
  module Compute
    class Packet
      class Real
        def list_plans
          request(
            expects: [200],
            method: 'GET',
            path: '/plans'
          )
        end

        def get_project_plans(project_id)
          request(
            expects: [200],
            method: 'GET',
            path: '/projects/' + project_id + '/plans'
          )
        end
      end

      class Mock
        def list_plans
          response = Excon::Response.new
          response.status = 200
          response.body = {
            'plans' => [
              {
                'id' => 'e69c0169-4726-46ea-98f1-939c9e8a3607',
                'slug' => 'baremetal_0',
                'name' => 'Type 0',
                'description' => 'Our Type 0 configuration is a general use "cloud killer" server, with a Intel Atom 2.4Ghz processor and 8GB of RAM.',
                'line' => 'baremetal',
                'specs' => {
                  'cpus' => [
                    {
                      'count' => 1,
                      'type' => 'Intel Atom C2550 @ 2.4Ghz'
                    }
                  ],
                  'memory' => {
                    'total' => '8GB'
                  },
                  'drives' => [
                    {
                      'count' => 1,
                      'size' => '80GB',
                      'type' => 'SSD'
                    }
                  ],
                  'nics' => [
                    {
                      'count' => 2,
                      'type' => '1Gbps'
                    }
                  ],
                  'features' =>
                            {
                              'raid' => false,
                              'txt' => true
                            }
                },
                'available_in' => [
                  {
                    'href' => '/facilities/8ea03255-89f9-4e62-9d3f-8817db82ceed'
                  },
                  {
                    'href' => '/facilities/2b70eb8f-fa18-47c0-aba7-222a842362fd'
                  },
                  {
                    'href' => '/facilities/8e6470b3-b75e-47d1-bb93-45b225750975'
                  },
                  {
                    'href' => '/facilities/e1e9c52e-a0bc-4117-b996-0fc94843ea09'
                  }
                ],
                'pricing' => {
                  'hour' => 0.07
                }
              }
            ]
          }

          response
        end
      end
    end
  end
end
