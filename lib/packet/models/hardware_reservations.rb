require_relative "hardware_reservation"

module Fog
  module Compute
    class Packet
      # HardwareReservations Collection
      class HardwareReservations < Fog::Collection
        model Fog::Compute::Packet::HardwareReservation

        def all(project_id, params = {})
          response = service.list_hardware_reservations(project_id, params)
          load(response.body["hardware_reservations"])
        end

        def get(id)
          response = service.get_hardware_reservation(id)
          new(response.body)
        end
      end
    end
  end
end
