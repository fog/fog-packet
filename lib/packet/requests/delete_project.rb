module Fog
  module Compute
    class Packet
      # Real
      class Real
        def delete_project(id)
          request(
            :expects => [204],
            :method => "DELETE",
            :path => "/projects/" + id
          )
        end
      end

      # Mock
      class Mock
        def delete_project(_id)
          response = Excon::Response.new
          response.status = 204
          response
        end
      end
    end
  end
end
