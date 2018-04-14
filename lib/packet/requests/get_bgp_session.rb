module Fog
  module Compute
    class Packet
      # Real
      class Real
        def get_bgp_session(session_id)
          request(
            :expects => [200],
            :method => "GET",
            :path => "/bgp/sessions/" + session_id
          )
        end
      end

      # Mock
      class Mock
        def get_bgp_session(session_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "id" => session_id,
            "status" => "unknown",
            "learned_routes" => [],
            "switch_name" => "esr1.d12.ewr1.packet.net",
            "created_at" => "2018-04-05T21:06:08Z",
            "device" => {
              "href" => "/devices/"
            },
            "address_family" => "ipv4",
            "href" => "/bgp/sessions/ae312253-bae6-4de3-b522-411c2372e29e"
          }
          response
        end
      end
    end
  end
end
