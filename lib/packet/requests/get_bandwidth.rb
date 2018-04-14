module Fog
  module Compute
    class Packet
      # Real
      class Real
        def get_bandwidth(device_id, from = "", to = "")
          url = "/devices/" + device_id + "/bandwidth"
          url += "/?from=" + from + "&until=" + to if from != "" && to != ""

          p url
          request(
            :expects => [201],
            :method => "GET",
            :path => url
          )
        end
      end

      # Mock
      class Mock
        def get_bandwidth(_device_id, _from = "", _to = "")
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
