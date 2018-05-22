require_relative "capacity"

module Fog
  module Compute
    class Packet
      # Capacities Collection
      class Capacities < Fog::Collection
        model Fog::Compute::Packet::Capacity

        def all
          response = service.get_capacity
          new(response.body["capacity"])
        end

        def get(id)
          response = service.get_device(id)
          new(response.body)
        end

        def validate(options)
          response = service.validate_capacity(options)
          true if response.status == 204
        end
      end
    end
  end
end
