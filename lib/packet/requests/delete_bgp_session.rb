module Fog
  module Compute
    class Packet
      # Real
      class Real
        def delete_bgp_session(session_id)
          request(
            :expects => [204],
            :method => "DELETE",
            :path => "/bgp/sessions/" + session_id
          )
        end
      end

      # Mock
      class Mock
        def delete_bgp_session(_session_id)
          response = Excon::Response.new
          response.status = 204
          response
        end
      end
    end
  end
end
