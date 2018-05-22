module Fog
  module Compute
    class Packet
      # Real
      class Real
        def get_email(id)
          request(
            :expects => [200],
            :method => "GET",
            :path => "/emails/" + id
          )
        end
      end

      # Mock
      class Mock
        def get_email(id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "id" => id,
            "address" => "jdoe@example.net",
            "default" => false,
            "href" => "/emails/1de4d14d-1c3e-4f33-b39a-2551af108f7e"
          }

          response
        end
      end
    end
  end
end
