require_relative "plan"

module Fog
  module Compute
    class Packet
      # Plans
      class VirtualNetworks < Fog::Collection
        model Fog::Compute::Packet::VirtualNetwork

        def all(project_id)
          response = service.list_virtual_networks(project_id)
          load(response.body["virtual_networks"])
        end
      end
    end
  end
end
