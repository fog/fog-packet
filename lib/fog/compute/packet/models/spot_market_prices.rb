require_relative "spot_market_price"

module Fog
  module Compute
    class Packet
      # Volumes
      class SpotMarketPrices < Fog::Collection
        model Fog::Compute::Packet::SpotMarketPrice

        def all
          response = service.list_spotmarketprices
          new(response.body)
        end

        def get(facility, plan)
          response = service.list_spotmarketprices_history(facility, plan)
          new(response.body)
        end
      end
    end
  end
end
