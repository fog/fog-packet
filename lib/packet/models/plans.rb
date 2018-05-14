require_relative "plan"

module Fog
  module Compute
    class Packet
      # Plans
      class Plans < Fog::Collection
        model Fog::Compute::Packet::Plans

        def all(params = {})
          response = service.list_plans(params)
          load(response.body["plans"])
        end
      end
    end
  end
end
