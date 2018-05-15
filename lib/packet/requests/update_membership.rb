module Fog
  module Compute
    class Packet
      # Real
      class Real
        def update_membership(id, options)
          roles = Hash.new {}
          roles["roles"] = options[:roles] if options[:roles]
          request(
            :expects => [200],
            :method => "PUT",
            :path => "/memberships/" + id,
            :body => Fog::JSON.encode(roles)
          )
        end
      end

      # Mock
      class Mock
        def update_membership(_id, _options)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "id" => "string",
            "roles" => [
              "string"
            ],
            "created_at" => "string",
            "updated_at" => "string",
            "project" => {
              "href" => "string"
            },
            "user" => {
              "href" => "string"
            },
            "href" => "string"
          }
          response
        end
      end
    end
  end
end
