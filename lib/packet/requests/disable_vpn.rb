module Fog
  module Compute
    class Packet
      # Real
      class Real
        def disable_vpn
          request(
            :expects => [204],
            :method => "DELETE",
            :path => "/user/vpn"
          )
        end
      end

      # Mock
      class Mock
        def disable_vpn
          response = Excon::Response.new
          response.status = 204
          response
        end
      end
    end
  end
end
