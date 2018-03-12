module Fog
  module Compute
    class Packet
      class Real
        def unassign_ip(ip_id)

          request(
            expects: [204],
            method: 'POST',
            path: '/ips/' + device_id,
          )
        end
      end

      class Mock
        def unassign_ip(ip_id)
          response = Excon::Response.new
          response.status = 204
          response
        end
      end
    end
  end
end
