module Fog
  module Compute
    class Packet
      class Real
        def list_snapshots(volume_id)
          p '/storage/' + volume_id + '/snapshots/'
          request(
            expects: [200],
            method: 'GET',
            path: '/storage/' + volume_id + '/snapshots',
            # body: Fog::JSON.encode(snapshot)
          )
        end
      end

      class Mock
        def list_snapshots(storage_id)
          response = Excon::Response.new
          response.status = 200
          response.body = { "snapshots" => [{ "id" => "39eaca27-3c42-4a98-acbd-0341503294f2", "status" => "available", "timestamp" => "1520630798.001449414", "created_at" => "2018-03-09T21:26:38.001Z", "volume" => { "href" => "/storage/64ad028f-ad75-4092-b974-531a80d7860d" } }, { "id" => "4b7d2f36-4781-4726-8974-ea28433d2f4a", "status" => "available", "timestamp" => "1520631308.764762547", "created_at" => "2018-03-09T21:35:08.764Z", "volume" => { "href" => "/storage/64ad028f-ad75-4092-b974-531a80d7860d" } }] }

          response
        end
      end
    end
  end
end
