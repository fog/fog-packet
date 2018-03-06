require_relative 'plan'

module Fog
  module Compute
    class Packet
      class Plans < Fog::Collection
        model Fog::Compute::Packet::Plans

        def all
          response = service.list_plans
          load(response.body)
        end
      end
    end
  end
end
