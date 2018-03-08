module Fog
  module Compute
    class Packet

      class Real
        def list_volumes(project_id)
          request(
              expects: [200],
              method: 'GET',
              path: '/projects/' + project_id + '/storage'
          )
        end
      end

      class Mock
        def list_volumes(project_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {'volumes' => [{'id' => '65541845-f729-441e-b053-127c9fd41ef3', 'name' => 'volume-65541845', 'description' => 'test description', 'size' => 20, 'locked' => false, 'billing_cycle' => 'hourly', 'state' => 'active', 'created_at' => '2018-03-08T13:14:07Z', 'updated_at' => '2018-03-08T13:14:08Z', 'access' => {'ips' => ['10.144.35.219', '10.144.51.245'], 'iqn' => 'iqn.2013-05.com.daterainc:tc:01:sn:f217eeaf693e3eb6'}, 'project' => {'href' => '/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8'}, 'facility' => {'href' => '/facilities/e1e9c52e-a0bc-4117-b996-0fc94843ea09'}, 'snapshot_policies' => [], 'attachments' => [], 'snapshots' => [], 'plan' => {'id' => '87728148-3155-4992-a730-8d1e6aca8a32', 'slug' => 'storage_1', 'name' => 'Standard', 'description' => 'TBD', 'line' => 'storage', 'specs' => {}, 'available_in' => [], 'pricing' => {'hour' => 0.000104}}, 'href' => '/storage/65541845-f729-441e-b053-127c9fd41ef3'}], 'meta' => {'first' => {'href' => '/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8/storage?page=1'}, 'previous' => nil, 'self' => {'href' => '/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8/storage?page=1'}, 'next' => nil, 'last' => {'href' => '/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8/storage?page=1'}, 'current_page' => 1, 'last_page' => 1, 'total' => 1}}

          response
        end
      end
    end
  end
end
