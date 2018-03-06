require_relative 'plan'

module Fog
  module Compute
    class Packet
      class Facilities < Fog::Collection
        model Fog::Compute::Packet::Plans

        def all
          response = service.list_facilities
          load(response.body)
        end
      end
    end
  end
end
