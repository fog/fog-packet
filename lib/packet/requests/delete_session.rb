module Fog
  module Compute
    class Packet
      # Real
      class Real
        def delete_session(session_id = "")
          url = "/session"
          url = "/sessions/" + session_id if session_id != ""
          request(
            :expects => [204],
            :method => "DELETE",
            :path => url
          )
        end
      end

      # Mock
      class Mock
        def delete_session(_session_id = "")
          response = Excon::Response.new
          response.status = 204
          response
        end
      end
    end
  end
end
