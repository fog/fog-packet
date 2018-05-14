require_relative "event"

module Fog
  module Compute
    class Packet
      # Events Collection
      class Events < Fog::Collection
        model Fog::Compute::Packet::Event

        def all(device_id, params = {})
          response = service.list_events(device_id, params)
          load(response.body["events"])
        end
      end
    end
  end
end
