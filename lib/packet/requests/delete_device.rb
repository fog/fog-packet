module Fog
  module Compute
    class Packet
      # Real
      class Real
        def delete_device(device_id)
          request(
            :expects => [204],
            :method => "DELETE",
            :path => "/devices/" + device_id
          )
        end
      end

      # Mock
      class Mock
        def delete_device(_device_id)
          response = Excon::Response.new
          response.status = 204
          response
        end
      end
    end
  end
end
