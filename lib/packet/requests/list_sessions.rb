module Fog
  module Compute
    class Packet
      # Real
      class Real
        def list_sessions(params = {})
          request(
            :expects => [200],
            :method => "GET",
            :path => "/sessions",
            :params => params
          )
        end
      end

      # Mock
      class Mock
        def list_sessions(_params = {})
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "sessions" => [
              {
                "id" => "fd8c403f-c81d-4de7-ba5e-91362fc2d71c",
                "token" => "thVsYD9FceLTdJdsrfjtLZGZPckx9Enh",
                "expires_at" => "2018-04-09T17:51:18Z",
                "created_at" => "2018-04-02T20:36:23Z",
                "updated_at" => "2018-04-06T17:51:18Z",
                "user" => {
                  "href" => "/users/2dce124f-3220-495c-907e-5bbbd4dda77c"
                }
              }
            ]
          }
          response
        end
      end
    end
  end
end
