require_relative 'volume'

module Fog
  module Compute
    class Packet
      # Volumes Collection
      class Volumes < Fog::Collection
        model Fog::Compute::Packet::Volumes

        def all(project_id)
          response = service.list_volumes(project_id)
          load(response.body)
        end
      end
    end
  end
end
