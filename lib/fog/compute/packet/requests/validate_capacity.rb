module Fog
  module Compute
    class Packet
      # Real
      class Real
        def validate_capacity(options)
          cap = {
            "servers" => []
          }
          options[:servers].each do |server|
            srv = {}
            srv["facility"] = server[:facility] if server[:facility]
            srv["plan"] = server[:plan] if server[:plan]
            srv["quantity"] = server[:quantity] if server[:quantity]

            cap["servers"] << srv
          end

          request(
            :expects => [204],
            :method => "POST",
            :path => "/capacity",
            :body => Fog::JSON.encode(cap)
          )
        end
      end

      # Mock
      class Mock
        def validate_capacity(_options)
          response = Excon::Response.new
          response.status = 204
          response
        end
      end
    end
  end
end
