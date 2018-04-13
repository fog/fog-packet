module Fog
  module Compute
    class Packet
      # Real
      class Real
        def disable_two_factor_auth(type)
          url = "/user/otp/" + type

          request(
            :expects => [204],
            :method => "DELETE",
            :path => url
          )
        end
      end

      # Mock
      class Mock
        def disable_two_factor_auth(_type)
          response = Excon::Response.new
          response.status = 204
          response
        end
      end
    end
  end
end
