module Fog
  module Compute
    class Packet
      class Real
        def detach_volume(attachment_id)
          request(
            expects: [204],
            method: 'DELETE',
            path: '/storage/attachments/' + attachment_id
          )
        end
      end

      class Mock
        def detach_volume(attachment_id)
          response = Excon::Response.new
          response.status = 204
          response.body = { 'id' => '8e4bd895-fba3-4a59-b9f8-dd20fc6568d0', 'created_at' => '2018-03-08T13:56:20Z', 'volume' => { 'href' => '/storage/3d1edaf3-2315-44ae-9591-6edcbbd0f731' }, 'device' => { 'href' => '/devices/0877721e-d48b-418b-bab7-62e67de452c7' }, 'href' => '/storage/attachments/8e4bd895-fba3-4a59-b9f8-dd20fc6568d0' }
          response
        end
      end
    end
  end
end
