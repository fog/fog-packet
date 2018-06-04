module Fog
  module Compute
    class Packet
      # Real
      class Real
        def decline_transfer_request(id)
          request(
            :expects => [204],
            :method => "PUT",
            :path => "/transfers/" + id
          )
        end
      end

      # Mock
      class Mock
        def decline_transfer_request(_id)
          response = Excon::Response.new
          response.status = 204

          response
        end
      end
    end
  end
end
