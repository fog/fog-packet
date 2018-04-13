module Fog
  module Compute
    class Packet
      # Bandwidth Collection
      class Bandwidth < Fog::Collection
        def get(device_id, from = "", to = "")
          response = service.get_bandwidth(device_id, from, to)

          response if response.status == 200
        end
      end
    end
  end
end
