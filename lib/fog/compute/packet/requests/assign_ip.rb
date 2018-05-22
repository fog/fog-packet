module Fog
  module Compute
    class Packet
      # Real
      class Real
        def assign_ip(device_id, options)
          req = {
            "address" => options[:address]
          }

          req["manageable"] = options[:manageable] if options[:manageable]

          request(
            :expects => [201],
            :method => "POST",
            :path => "/devices/" + device_id + "/ips",
            :body => Fog::JSON.encode(req)
          )
        end
      end

      # Mock
      class Mock
        def assign_ip(_volume_id, _device_id)
          response = Excon::Response.new
          response.status = 201
          response
        end
      end
    end
  end
end
