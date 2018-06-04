module Fog
  module Compute
    class Packet
      # Real
      class Real
        def create_bgp_session(device_id, address_family)
          request(
            :expects => [201],
            :method => "POST",
            :path => "/devices/" + device_id + "/bgp/sessions?address_family=" + address_family
          )
        end
      end

      # Mock
      class Mock
        def create_bgp_session(device_id, address_family)
          response = Excon::Response.new
          response.status = 201
          response.body = {
            "id" => "ae312253-bae6-4de3-b522-411c2372e29e",
            "status" => "unknown",
            "learned_routes" => [],
            "switch_name" => "esr1.d12.ewr1.packet.net",
            "created_at" => "2018-04-05T21:06:08Z",
            "device" => {
              "href" => "/devices/" + device_id
            },
            "address_family" => address_family,
            "href" => "/bgp/sessions/ae312253-bae6-4de3-b522-411c2372e29e"
          }
          response
        end
      end
    end
  end
end
