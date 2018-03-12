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
      end
    end
  end
end
