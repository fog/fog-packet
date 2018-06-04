module Fog
  module Compute
    class Packet
      # Real
      class Real
        def assign_port(port_id, vnid)
          request(
            :expects => [200],
            :method => "POST",
            :path => "/ports/" + port_id + "/assign?vnid=" + vnid
          )
        end
      end

      # Mock
      class Mock
        def assign_port(_port_id, _vnid)
          response = Excon::Response.new
          response.status = 200
          response
        end
      end
    end
  end
end
