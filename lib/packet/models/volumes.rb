require_relative "volume"

module Fog
  module Compute
    class Packet
      # Volumes Collection
      class Volumes < Fog::Collection
        model Fog::Compute::Packet::Volume

        def all(project_id)
          response = service.list_volumes(project_id)

          load(response.body["volumes"])
        end

        def get(volume_id)
          response = service.get_volume(volume_id)
          new(response.body)
        end
      end
    end
  end
end
