module Fog
  module Compute
    class Packet
      # Real
      class Real
        def request_email_verification(email)
          request(
            :expects => [201],
            :method => "POST",
            :path => "/verify-email?login=" + email
          )
        end
      end

      # Mock
      class Mock
        def request_email_verification(_email)
          response = Excon::Response.new
          response.status = 201
          response
        end
      end
    end
  end
end
