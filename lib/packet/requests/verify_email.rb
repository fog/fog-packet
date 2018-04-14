module Fog
  module Compute
    class Packet
      # Real
      class Real
        def verify_email(token)
          request(
            :expects => [200],
            :method => "POST",
            :path => "/verify-email?token=" + token
          )
        end
      end

      # Mock
      class Mock
        def verify_email(_token)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "id" => "25a602c3-76b9-4de7-8b06-10d277f2a03b",
            "token" => "aE5Ye1evHw5ds8CrFB9mYf7qS3JZQ6my",
            "expires_at" => "2018-04-13T10:50:26Z",
            "created_at" => "2018-04-12T10:50:26Z",
            "updated_at" => "2018-04-12T10:50:26Z",
            "user" => {
              "href" => "/users/dbb25187-2f7e-4d53-a6de-d7b3e2b6d2ba"
            },
            "read_only" => false
          }
          response
        end
      end
    end
  end
end
