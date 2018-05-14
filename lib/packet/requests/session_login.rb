module Fog
  module Compute
    class Packet
      # Real
      class Real
        def session_login(login_params)
          request(
            :expects => [201],
            :method => "POST",
            :path => "/sessions?login=" + login_params[:username] + "&password=" + login_params[:password]
          )
        end
      end

      # Mock
      class Mock
        def session_login(_login_params)
          response = Excon::Response.new
          response.status = 201
          response
        end
      end
    end
  end
end
