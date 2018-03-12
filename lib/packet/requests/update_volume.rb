module Fog
  module Compute
    class Packet
      class Real
        def update_device(volume_id, options)
          device = Hash.new {}
          device['description'] = options[:description] if options[:description]
          device['billing_cycle'] = options[:billing_cycle] if options[:billing_cycle]
          device['size'] = options[:size] if options[:size]
          device['locked'] = options[:locked] if options[:locked]

          request(
            expects: [200],
            method: 'PUT',
            path: '/storage/' + device_id,
            body: Fog::JSON.encode(device)
          )
        end
      end

      class Mock
        def update_device(volume_id, options)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            'id' => id,
            'name' => 'volume-870f9650',
            'description' => 'test description',
            'size' => 20,
            'locked' => false,
            'billing_cycle' => 'hourly',
            'state' => 'active',
            'created_at' => '2018-03-08T12:49:30Z',
            'updated_at' => '2018-03-08T12:49:30.682Z',
            'access' => {},
            'project' => {
              'href' => '/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8'
            },
            'facility' => {
              'href' => '/facilities/e1e9c52e-a0bc-4117-b996-0fc94843ea09'
            },
            'snapshot_policies' => [],
            'attachments' => [],
            'snapshots' => [],
            'plan' => {
              'id' => '87728148-3155-4992-a730-8d1e6aca8a32',
              'slug' => 'storage_1',
              'name' => 'Standard',
              'description' => 'TBD',
              'line' => 'storage',
              'specs' => {},
              'available_in' => [],
              'pricing' => {
                'hour' => 0.000104
              }
            },
            'href' => '/storage/870f9650-19ea-48bd-84c5-ddf97471c1c1'
          }
          response
        end
      end
    end
  end
end
