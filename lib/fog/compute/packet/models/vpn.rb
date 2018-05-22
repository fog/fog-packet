module Fog
  module Compute
    class Packet
      # Vpn Model
      class Vpn < Fog::Model
        attribute :config

        attr_accessor :options

        def initialize(attributes = {})
          super
        end
      end
    end
  end
end
