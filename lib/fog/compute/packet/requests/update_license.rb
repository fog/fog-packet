module Fog
  module Compute
    class Packet
      # Real
      class Real
        def update_license(id, options)
          project = Hash.new {}
          project["description"] = options[:description] if options[:description]
          project["size"] = options[:size] if options[:size]

          request(
            :expects => [200],
            :method => "PUT",
            :path => "/licenses/" + id,
            :body => Fog::JSON.encode(project)
          )
        end
      end

      # Mock
      class Mock
        def update_license(id, options)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "id" => id,
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
