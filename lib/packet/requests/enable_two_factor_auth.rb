module Fog
  module Compute
    class Packet
      # Real
      class Real
        def enable_two_factor_auth(type)
          url = "/user/otp/" + type
          request(
            :expects => [200],
            :method => "POST",
            :path => url
          )
        end
      end

      # Mock
      class Mock
        def enable_two_factor_auth(_type)
          response = Excon::Response.new
          response.status = 200
          response
        end
      end
    end
  end
end
