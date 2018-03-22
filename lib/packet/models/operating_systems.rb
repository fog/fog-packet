require_relative "plan"

module Fog
  module Compute
    class Packet
      # Plans
      class OperatingSystems < Fog::Collection
        model Fog::Compute::Packet::OperatingSystem

        def all
          response = service.list_operating_systems
          load(response.body["operating_systems"])
        end
      end
    end
  end
end
