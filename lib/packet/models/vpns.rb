require_relative "vpn"

module Fog
  module Compute
    class Packet
      # Projects Collection
      class Vpns < Fog::Collection
        model Fog::Compute::Packet::Vpn

        def get(facility_code)
          response = service.get_vpn(facility_code)
          new(response.body)
        end

        def enable
          response = service.enable_vpn
          true if response.status == 201
        end

        def disable
          response = service.disable_vpn
          true if response.status == 204
        end
      end
    end
  end
end
