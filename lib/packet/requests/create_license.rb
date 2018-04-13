module Fog
  module Compute
    class Packet
      # Real
      class Real
        def create_license(project_id, options)
          license = {
            "description" => options[:description],
            "size" => options[:size]
          }

          license["license_product_id"] = options[:license_product_id] if options[:license_product_id]

          request(
            :expects => [201],
            :method => "POST",
            :path => "/projects/" + project_id + "/licenses",
            :body => Fog::JSON.encode(license)
          )
        end
      end

      # Mock
      class Mock
        def create_license(_project_id, options)
          response = Excon::Response.new
          response.status = 201
          response.body = {
            "id" => "fd8c403f-c81d-4de7-ba5e-91362fc2d71c",
            "description" => options[:description],
            "license_key" => "2018-04-09T17:51:18Z",
            "licensee_product" => {
              "href" => "/"
            },
            "size" => options[:size],
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
