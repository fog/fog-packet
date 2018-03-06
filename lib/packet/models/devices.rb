require_relative 'plan'

module Fog
  module Compute
    class Packet
      class Facilities < Fog::Collection
        model Fog::Compute::Packet::Plans

        def all(project_id)
          response = service.list_project_devices(project_id)
          load(response.body)
        end

        def all(project_id, device_id)
          response = service.get_device(project_id, device_id)
          load(response.body)
        end
      end
    end
  end
end
