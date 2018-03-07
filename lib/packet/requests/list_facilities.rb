module Fog
  module Compute
    class Packet

      class Real
        def list_facilities
          request(
            expects: [200],
            method: 'GET',
            path: '/facilities'
          )
        end

        def get_project_facilities(project_id)
          request(
            expects: [200],
            method: 'GET',
            path: '/projects/#{project_id}/facilities'
          )
        end
      end

      class Mock
        def list_facilities
          response = Excon::Response.new
          response.status = 200
          response.body = {'facilities' => [{'id' => 'fd8c403f-c81d-4de7-ba5e-91362fc2d71c', 'name' => 'Singapore', 'code' => 'sin1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#75006fc8-b6f4-4dd5-a89f-262b9a18e6cd'}, 'ip_ranges' => []}, {'id' => '14a4cad8-6f81-41b6-8cba-aaf8322910af', 'name' => 'Atlanta, GA', 'code' => 'atl1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#efe47e28-626d-4fa6-b8be-786d16e91b59'}, 'ip_ranges' => []}, {'id' => '75b74ee6-d7af-4a65-82ca-73c895cd50a9', 'name' => 'Chicago, IL', 'code' => 'ord1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#db70600d-5ba6-4337-ae0d-aebb6b91cb48'}, 'ip_ranges' => []}, {'id' => '855e3cd5-d27c-4330-9b9f-1ffd7e9bfff5', 'name' => 'Dallas, TX', 'code' => 'dfw1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#319837d3-9d42-45e3-964d-be8d119ad0a5'}, 'ip_ranges' => []}, {'id' => 'ad136386-a3b5-4127-b5a4-1c6ff0cc5ddb', 'name' => 'Los Angeles, CA', 'code' => 'lax1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#06591a5a-161e-4734-b69c-a3b95ed3e926'}, 'ip_ranges' => []}, {'id' => '8dd1568c-45be-40c0-998c-b47e7cbe3912', 'name' => 'Ashburn, VA', 'code' => 'iad1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#80417bc9-3275-4f81-bf69-f66bf6a789ca'}, 'ip_ranges' => []}, {'id' => '92d199e7-3203-4df1-afb5-f16a890150ac', 'name' => 'Toronto, ON, CA', 'code' => 'yyz1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#a9cb3ce0-6b3c-4cf3-b6dd-4b636c0cf9c8'}, 'ip_ranges' => []}, {'id' => '8f3eb9dc-cd96-486d-9326-3c11b22a18ac', 'name' => 'Frankfurt, DE', 'code' => 'fra1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#9eb551bc-de47-4f84-b4f9-d0175a1d1852'}, 'ip_ranges' => []}, {'id' => 'fe4d0bcc-ffb4-488b-9a62-9a983ed0d66d', 'name' => 'Hong Kong, HK', 'code' => 'hkg1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#599db205-8675-4bea-b3ae-a658c4f96dad'}, 'ip_ranges' => []}, {'id' => 'ca3bb830-4aa2-4226-9daa-8d67be3c0c61', 'name' => 'Seattle, WA', 'code' => 'sea1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#ff53ac8d-784f-43ff-a095-5ee6b716a603'}, 'ip_ranges' => []}, {'id' => 'c4501630-3713-4751-8ea8-65d9ed8ae18f', 'name' => 'Sydney, Australia', 'code' => 'syd1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#f4c49a9b-63fc-42b0-a6cc-0fb473e5a83a'}, 'ip_ranges' => []}, {'id' => '8ea03255-89f9-4e62-9d3f-8817db82ceed', 'name' => 'Tokyo, JP', 'code' => 'nrt1', 'features' => %w[baremetal layer_2 storage], 'address' => {'href' => '#7952fcbb-f2a9-44c8-bdf3-52b8f26514a0'}, 'ip_ranges' => ['2604:1380:3000::/36', '147.75.110.0/23', '147.75.92.0/22']}, {'id' => '2b70eb8f-fa18-47c0-aba7-222a842362fd', 'name' => 'Sunnyvale, CA', 'code' => 'sjc1', 'features' => %w[baremetal storage layer_2 backend_transfers], 'address' => {'href' => '#9dba11a6-0a26-4993-901b-df253713b89e'}, 'ip_ranges' => ['2604:1380:1000::/36', '147.75.200.0/22', '147.75.108.0/22', '147.75.68.0/22', '147.75.88.0/22']}, {'id' => '8e6470b3-b75e-47d1-bb93-45b225750975', 'name' => 'Amsterdam, NL', 'code' => 'ams1', 'features' => %w[baremetal storage], 'address' => {'href' => '#0688e909-647e-4b21-bdf2-fc056d993fc5'}, 'ip_ranges' => ['2604:1380:2000::/36', '147.75.204.0/23', '147.75.100.0/22', '147.75.80.0/22', '147.75.32.0/23']}, {'id' => 'e1e9c52e-a0bc-4117-b996-0fc94843ea09', 'name' => 'Parsippany, NJ', 'code' => 'ewr1', 'features' => %w[baremetal storage backend_transfers layer_2], 'address' => nil, 'ip_ranges' => ['2604:1380::/36', '147.75.192.0/21', '147.75.64.0/22', '147.75.72.0/22', '147.75.76.0/22', '147.75.104.0/22', '147.75.96.0/20']}]}


          response
        end

        def get_project_facilities(project_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {'facilities' => [{'id' => 'fd8c403f-c81d-4de7-ba5e-91362fc2d71c', 'name' => 'Singapore', 'code' => 'sin1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#75006fc8-b6f4-4dd5-a89f-262b9a18e6cd'}, 'ip_ranges' => []}, {'id' => '14a4cad8-6f81-41b6-8cba-aaf8322910af', 'name' => 'Atlanta, GA', 'code' => 'atl1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#efe47e28-626d-4fa6-b8be-786d16e91b59'}, 'ip_ranges' => []}, {'id' => '75b74ee6-d7af-4a65-82ca-73c895cd50a9', 'name' => 'Chicago, IL', 'code' => 'ord1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#db70600d-5ba6-4337-ae0d-aebb6b91cb48'}, 'ip_ranges' => []}, {'id' => '855e3cd5-d27c-4330-9b9f-1ffd7e9bfff5', 'name' => 'Dallas, TX', 'code' => 'dfw1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#319837d3-9d42-45e3-964d-be8d119ad0a5'}, 'ip_ranges' => []}, {'id' => 'ad136386-a3b5-4127-b5a4-1c6ff0cc5ddb', 'name' => 'Los Angeles, CA', 'code' => 'lax1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#06591a5a-161e-4734-b69c-a3b95ed3e926'}, 'ip_ranges' => []}, {'id' => '8dd1568c-45be-40c0-998c-b47e7cbe3912', 'name' => 'Ashburn, VA', 'code' => 'iad1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#80417bc9-3275-4f81-bf69-f66bf6a789ca'}, 'ip_ranges' => []}, {'id' => '92d199e7-3203-4df1-afb5-f16a890150ac', 'name' => 'Toronto, ON, CA', 'code' => 'yyz1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#a9cb3ce0-6b3c-4cf3-b6dd-4b636c0cf9c8'}, 'ip_ranges' => []}, {'id' => '8f3eb9dc-cd96-486d-9326-3c11b22a18ac', 'name' => 'Frankfurt, DE', 'code' => 'fra1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#9eb551bc-de47-4f84-b4f9-d0175a1d1852'}, 'ip_ranges' => []}, {'id' => 'fe4d0bcc-ffb4-488b-9a62-9a983ed0d66d', 'name' => 'Hong Kong, HK', 'code' => 'hkg1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#599db205-8675-4bea-b3ae-a658c4f96dad'}, 'ip_ranges' => []}, {'id' => 'ca3bb830-4aa2-4226-9daa-8d67be3c0c61', 'name' => 'Seattle, WA', 'code' => 'sea1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#ff53ac8d-784f-43ff-a095-5ee6b716a603'}, 'ip_ranges' => []}, {'id' => 'c4501630-3713-4751-8ea8-65d9ed8ae18f', 'name' => 'Sydney, Australia', 'code' => 'syd1', 'features' => %w[baremetal layer_2], 'address' => {'href' => '#f4c49a9b-63fc-42b0-a6cc-0fb473e5a83a'}, 'ip_ranges' => []}, {'id' => '8ea03255-89f9-4e62-9d3f-8817db82ceed', 'name' => 'Tokyo, JP', 'code' => 'nrt1', 'features' => %w[baremetal layer_2 storage], 'address' => {'href' => '#7952fcbb-f2a9-44c8-bdf3-52b8f26514a0'}, 'ip_ranges' => ['2604:1380:3000::/36', '147.75.110.0/23', '147.75.92.0/22']}, {'id' => '2b70eb8f-fa18-47c0-aba7-222a842362fd', 'name' => 'Sunnyvale, CA', 'code' => 'sjc1', 'features' => %w[baremetal storage layer_2 backend_transfers], 'address' => {'href' => '#9dba11a6-0a26-4993-901b-df253713b89e'}, 'ip_ranges' => ['2604:1380:1000::/36', '147.75.200.0/22', '147.75.108.0/22', '147.75.68.0/22', '147.75.88.0/22']}, {'id' => '8e6470b3-b75e-47d1-bb93-45b225750975', 'name' => 'Amsterdam, NL', 'code' => 'ams1', 'features' => %w[baremetal storage], 'address' => {'href' => '#0688e909-647e-4b21-bdf2-fc056d993fc5'}, 'ip_ranges' => ['2604:1380:2000::/36', '147.75.204.0/23', '147.75.100.0/22', '147.75.80.0/22', '147.75.32.0/23']}, {'id' => 'e1e9c52e-a0bc-4117-b996-0fc94843ea09', 'name' => 'Parsippany, NJ', 'code' => 'ewr1', 'features' => %w[baremetal storage backend_transfers layer_2], 'address' => nil, 'ip_ranges' => ['2604:1380::/36', '147.75.192.0/21', '147.75.64.0/22', '147.75.72.0/22', '147.75.76.0/22', '147.75.104.0/22', '147.75.96.0/20']}]}


          response
        end

      end
    end
  end
end
