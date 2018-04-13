module Fog
  module Compute
    class Packet
      # Real
      class Real
        def get_batch(id)
          request(
            :expects => [200],
            :method => "GET",
            :path => "/batches/" + id
          )
        end
      end

      # Mock
      class Mock
        def get_batch(id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "id" => id,
            "error_messages" => [],
            "quantity" => 1,
            "state" => "completed",
            "created_at" => "2018-04-03T11:47:52Z",
            "updated_at" => "2018-04-03T11:47:55Z",
            "devices" => [],
            "project" => {
              "href" => "/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
            }
          }

          response
        end
      end
    end
  end
end
