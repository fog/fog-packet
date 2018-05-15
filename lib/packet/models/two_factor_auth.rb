module Fog
  module Compute
    class Packet
      # TwoFactorAuth Collection
      class TwoFactorAuth < Fog::Collection
        def enable(type)
          response = service.enable_two_factor_auth(type)
          true if response.status == 200
        end

        def disable(type)
          response = service.disable_two_factor_auth(type)
          true if response.status == 204
        end
      end
    end
  end
end
