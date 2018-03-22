require_relative "facility"

module Fog
  module Compute
    class Packet
      # Facilities Collection
      class Facilities < Fog::Collection
        model Fog::Compute::Packet::Facility

        def all
          response = service.list_facilities
          load(response.body["facilities"])
        end
      end
    end
  end
end
