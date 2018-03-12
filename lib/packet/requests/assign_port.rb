module Fog
  module Compute
    class Packet
      class Real
        def assign_port(port_id, vnid)
          request(
            expects: [200],
            method: 'POST',
            path: '/ports/' + port_id + '/assign?vnid=' + vnid
          )
        end
      end

      class Mock
        def assign_port(port_id, vnid)
          response = Excon::Response.new
          response.status = 200
          response
        end
      end
    end
  end
end
