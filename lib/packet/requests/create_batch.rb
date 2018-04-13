module Fog
  module Compute
    class Packet
      # Real
      class Real
        def create_batch(project_id, options)
          request(
            :expects => [201],
            :method => "POST",
            :path => "/projects/" + project_id + "/devices/batch",
            :body => Fog::JSON.encode(options)
          )
        end
      end

      # Mock
      class Mock
        def create_batch(_project_id, _options)
          response = Excon::Response.new
          response.status = 201
          response.body = {
            "batches" => [
              {
                "id" => "54f09319-ce00-4715-8916-77faa64d4574",
                "quantity" => 1,
                "state" => "completed",
                "created_at" => "2018-04-03T11:47:52Z",
                "updated_at" => "2018-04-03T11:47:55Z",
                "devices" => [],
                "project" => {
                  "href" => "/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
                },
                "error_messages" => []
              }
            ]
          }

          response
        end
      end
    end
  end
end
