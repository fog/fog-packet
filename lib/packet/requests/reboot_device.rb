module Fog
  module Compute
    class Packet
      class Real
        def reboot_device(device_id)
          action = {
            'type' => 'reboot'
          }

          request(
            expects: [201],
            method: 'POST',
            path: '/devices/' + device_id + '/actions',
            body: Fog::JSON.encode(action)
          )
        end
      end

      class Mock
        def reboot_device(device_id)
          response = Excon::Response.new
          response.status = 202
          response.body = {
            'id' => device_id,
            'short_id' => '8f65b7eb',
            'hostname' => 'test01',
            'description' => nil,
            'state' => 'active',
            'tags' => [],
            'image_url' => nil,
            'billing_cycle' => 'hourly',
            'user' => 'core',
            'iqn' => 'iqn.2018-03.net.packet:device.8f65b7eb',
            'locked' => false,
            'bonding_mode' => 5,
            'created_at' => '2018-03-07T14:13:27Z',
            'updated_at' => '2018-03-07T14:13:29.697Z',
            'ipxe_script_url' => nil,
            'always_pxe' => false,
            'storage' => nil,
            'provisioning_percentage' => 0.0,
            'operating_system' => {
              'id' => 'd61c3912-8422-4daf-835e-854efa0062e4',
              'slug' => 'coreos_stable',
              'name' => 'Container Linux (CoreOS) - Stable',
              'distro' => 'coreos',
              'version' => 'stable',
              'provisionable_on' => [
                'm2.xlarge.x86'
              ],
              'default_cidr_size' => 31
            },
            'facility' => {
              'id' => 'e1e9c52e-a0bc-4117-b996-0fc94843ea09',
              'name' => 'Parsippany, NJ',
              'code' => 'ewr1',
              'features' =>
                      [
                        'baremetal'
                      ],
              'address' => nil,
              'ip_ranges' => [
                '2604:1380::/36'
              ]
            },
            'project' =>
                  {
                    'href' => '/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8'
                  },
            'ssh_keys' => [
              {
                'href' => '/ssh-keys/38f2f61a-e0d7-4753-bebb-b580da2d43ac'
              },
              {
                'href' => '/ssh-keys/084a5dec-30be-415a-8937-9c615932e459'
              },
              {
                'href' => '/ssh-keys/a8d6cc17-7d9d-4fb9-8190-afdb301b67df'
              },
              {
                'href' => '/ssh-keys/eacfb002-45e1-4047-a0d5-cd9d8bab19ed'
              },
              {
                'href' => '/ssh-keys/61905e3c-aa23-4ad3-922d-63cbd29060f9'
              },
              {
                'href' => '/ssh-keys/a3d8bebe-574f-427d-80ee-bc2ba17f7074'
              }
            ],
            'project_lite' => {
              'href' => '/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8'
            },
            'volumes' => [],
            'ip_addresses' => [],
            'plan' => {
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
                'features' => {
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
                { 'href' => '/facilities/8e6470b3-b75e-47d1-bb93-45b225750975' },
                {
                  'href' => '/facilities/e1e9c52e-a0bc-4117-b996-0fc94843ea09'
                }
              ], 'pricing' => {
                'hour' => 0.07
              }
            },
            'userdata' => '',
            'switch_uuid' => '6ce8785a',
            'provisioning_events' => [
              {
                'id' => nil,
                'type' => 'provisioning.101',
                'body' => 'Provisioning started',
                'state' => nil,
                'created_at' => nil,
                'relationships' => [],
                'ip' => nil,
                'modified_by' => nil,
                'interpolated' => 'Provisioning started'
              },
              {
                'id' => nil,
                'type' => 'provisioning.102',
                'body' => 'Network configured',
                'state' => nil,
                'created_at' => nil,
                'relationships' => [],
                'ip' => nil,
                'modified_by' => nil,
                'interpolated' => 'Network configured'
              },
              'network_ports' => [
                {
                  'id' => '8eb55ecb-73ed-4ff7-b933-3f7fe2ae1a4e',
                  'type' => 'NetworkBondPort',
                  'name' => 'bond0',
                  'data' => {
                    'bonded' => true
                  },
                  'hardware' => {
                    'href' => '/hardware/da6b785b-1b7d-4ed5-b61b-e09ec1bac16d'
                  },
                  'virtual_networks' => [],
                  'connected_port' => nil,
                  'href' => '/ports/8eb55ecb-73ed-4ff7-b933-3f7fe2ae1a4e'
                }
              ], 'href' => '/devices/8f65b7eb-80a5-4df0-a87d-030d1b0d3b77'
            ]
          }
          response
        end
      end
    end
  end
end
