module Fog
  module Compute
    class Packet
      # Real
      class Real
        def get_vpn(facility_code)
          request(
            :expects => [200],
            :method => "GET",
            :path => "/user/vpn?code=" + facility_code
          )
        end
      end

      # Mock
      class Mock
        def get_vpn(_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "config" => "client\nserver-poll-timeout"
          }

          response
        end
      end
    end
  end
end
