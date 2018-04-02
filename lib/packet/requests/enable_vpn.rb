module Fog
  module Compute
    class Packet
      # Real
      class Real
        def enable_vpn
          request(
            :expects => [201],
            :method => "POST",
            :path => "/user/vpn"
          )
        end
      end

      # Mock
      class Mock
        def enable_vpn
          response = Excon::Response.new
          response.status = 201
          response
        end
      end
    end
  end
end
