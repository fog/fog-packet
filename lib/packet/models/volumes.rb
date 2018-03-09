require_relative 'plan'

module Fog
  module Compute
    class Packet
      class Volumes < Fog::Collection
        model Fog::Compute::Packet::Plans

        def all(project_id)
          response = service.list_volumes(project_id)
          load(response.body)
        end

        def all(project_id, volume_id)
          response = service.get_volume(project_id, volume_id)
          load(response.body)
        end
      end
    end
  end
end
