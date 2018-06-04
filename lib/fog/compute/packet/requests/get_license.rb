module Fog
  module Compute
    class Packet
      # Real
      class Real
        def get_license(id)
          request(
            :expects => [200],
            :method => "GET",
            :path => "/licenses/" + id
          )
        end
      end

      # Mock
      class Mock
        def get_license(id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "id" => id,
            "description" => "thVsYD9FceLTdJdsrfjtLZGZPckx9Enh",
            "license_key" => "2018-04-09T17:51:18Z",
            "licensee_product" => {
              "href" => "/"
            },
            "size" => "2018-04-06T17:51:18Z",
            "project" => {
              "href" => "/"
            }
          }
          response
        end
      end
    end
  end
end
