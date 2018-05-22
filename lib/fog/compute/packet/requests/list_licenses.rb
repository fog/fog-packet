module Fog
  module Compute
    class Packet
      # Real
      class Real
        def list_licenses(project_id, params = {})
          request(
            :expects => [200],
            :method => "GET",
            :path => "/projects/" + project_id + "/licenses",
            :params => params
          )
        end
      end

      # Mock
      class Mock
        def list_licenses(_project_id, _params = {})
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "licenses" => [
              {
                "id" => "fd8c403f-c81d-4de7-ba5e-91362fc2d71c",
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
            ]
          }
          response
        end
      end
    end
  end
end
