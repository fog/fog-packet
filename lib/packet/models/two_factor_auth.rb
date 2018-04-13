module Fog
  module Compute
    class Packet
      # TwoFactorAuth Collection
      class TwoFactorAuth < Fog::Collection
        def enable
          service.enable_two_factor_auth
          true
        end

        def disable
          service.disable_two_factor_auth
          true
        end
      end
    end
  end
end
