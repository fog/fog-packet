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
        rescue Excon::Errors::NotFound
          nil
        end

        def enable
          service.enable_vpn
          true
        end

        def disable
          service.disable_vpn
          true
        end
      end
    end
  end
end
