require_relative "device"

module Fog
  module Compute
    class Packet
      # Devices Collection
      class Devices < Fog::Collection
        model Fog::Compute::Packet::Device

        def all(project_id)
          response = service.list_devices(project_id)
          load(response.body["devices"])
        end

        def get(id)
          response = service.get_device(id)
          new(response.body)
        end
      end
    end
  end
end
