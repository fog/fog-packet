require_relative 'plan'

module Fog
  module Compute
    class Packet
      class Ips < Fog::Collection
        model Fog::Compute::Packet::Plans

        def all
          response = service.list_ips(project_id)
          load(response.body)
        end
      end
    end
  end
end
