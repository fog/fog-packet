module Fog
  module Compute
    class Packet
      # Ip Model
      class SpotMarketPrice < Fog::Model
        attribute :spot_market_prices
        attribute :prices_history

        def initialize(attributes = {})
          super
        end
      end
    end
  end
end
