module Fog
  module Compute
    class Packet
      # Real
      class Real
        def disbond_ports(port_id, bulk_disable)
          request(
            :expects => [200],
            :method => "POST",
            :path => "/ports/" + port_id + "/disbond?bulk_disable=" + (bulk_disable ? "true" : "false")
          )
        end
      end

      # Mock
      class Mock
        def disbond_ports(_port_id, _bulk_disable)
          response = Excon::Response.new
          response.status = 200
          response
        end
      end
    end
  end
end
