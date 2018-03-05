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

        # def get(id)
        #   response = service.get_plan(id)
        #   new(response.body)
        # rescue Excon::Errors::NotFound
        #   nil
        # end
      end
    end
  end
end
