module Fog
  module Compute
    class Packet
      # Real
      class Real
        def unassign_ip(ip_id)
          request(
            :expects => [204],
            :method => "POST",
            :path => "/ips/" + ip_id
          )
        end
      end
      # Mock
      class Mock
        def unassign_ip(_ip_id)
          response = Excon::Response.new
          response.status = 204
          response
        end
      end
    end
  end
end
