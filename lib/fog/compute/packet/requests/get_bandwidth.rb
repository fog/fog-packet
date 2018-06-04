module Fog
  module Compute
    class Packet
      # Real
      class Real
        def get_bandwidth(device_id, params)
          request(
            :expects => [201],
            :method => "GET",
            :path => "/devices/" + device_id + "/bandwidth",
            :params => params
          )
        end
      end

      # Mock
      class Mock
        def get_bandwidth(_device_id, _params = {})
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "bandwidth" => [{
              "datapoints" => []
            }]
          }
          response
        end
      end
    end
  end
end
