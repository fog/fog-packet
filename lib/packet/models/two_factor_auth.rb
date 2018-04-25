module Fog
  module Compute
    class Packet
      # TwoFactorAuth Collection
      class TwoFactorAuth < Fog::Collection
        def enable(type)
          service.enable_two_factor_auth(type)
          true
        end

        def disable(type)
          service.disable_two_factor_auth(type)
          true
        end
      end
    end
  end
end
