module Fog
  module Compute
    class Packet
      # Bandwidth Collection
      class Bandwidth < Fog::Collection
        def get(device_id, params = {})
          response = service.get_bandwidth(device_id, params)

          response if response.status == 200
        end
      end
    end
  end
end
