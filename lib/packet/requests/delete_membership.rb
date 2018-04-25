module Fog
  module Compute
    class Packet
      # Real
      class Real
        def delete_membership(id)
          request(
            :expects => [204],
            :method => "DELETE",
            :path => "/memberships/" + id
          )
        end
      end

      # Mock
      class Mock
        def delete_membership(id)
          response = Excon::Response.new
          response.status = 204
          response
        end
      end
    end
  end
end
