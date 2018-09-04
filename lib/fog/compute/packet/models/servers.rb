require_relative "server"

module Fog
  module Compute
    class Packet
      # Devices Collection
      class Servers < Fog::Collection
        model Fog::Compute::Packet::Server

        def all(project_id, params = {})
          response = service.list_devices(project_id, params)
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
