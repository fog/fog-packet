module Fog
  module Compute
    class Packet
      # Real
      class Real
        def list_spotmarketprices_history(facility, plan)
          request(
            :expects => [200],
            :method => "GET",
            :path => "/market/spot/prices/history?facility=" + facility + "&plan=" + plan
          )
        end
      end

      # Mock
      class Mock
        def list_spotmarketprices_history(_facility, _plan)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "prices_history" => [
              {
                "datapoints" => [
                  [0.20134615384615362, 1_515_134_400],
                  [0.3715384615384616, 1_515_165_600],
                  [0.4628846153846158, 1_515_196_800],
                  [0.06865384615384605, 1_515_228_000]
                ],
                "target" => "api_metrics.spot_market_price.ewr1.baremetal_0",
                "tags" => {
                  "name" => "api_metrics.spot_market_price.ewr1.baremetal_0"
                }
              }
            ]
          }

          response
        end
      end
    end
  end
end
