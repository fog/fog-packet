module Fog
  module Compute
    class Packet
      # Real
      class Real
        def delete_volume(id)
          request(
            :expects => [204],
            :method => "DELETE",
            :path => "/storage/" + id
          )
        end
      end

      # Mock
      class Mock
        def delete_volume(_id)
          response = Excon::Response.new
          response.status = 204
          response
        end
      end
    end
  end
end
