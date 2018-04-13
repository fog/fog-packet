require_relative "bgp_session"

module Fog
  module Compute
    class Packet
      # BgpSessions Collection
      class BgpSessions < Fog::Collection
        model Fog::Compute::Packet::BgpSession

        def all(device_id)
          response = service.list_bgp_sessions(device_id)
          load(response.body["bgp_sessions"])
        end

        def get(id)
          response = service.get_bgp_session(id)
          new(response.body)
        end
      end
    end
  end
end
