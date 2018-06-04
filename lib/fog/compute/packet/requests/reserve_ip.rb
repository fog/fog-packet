module Fog
  module Compute
    class Packet
      # Real
      class Real
        def reserve_ip(project_id, options)
          ip = {
            "facility" => options[:facility],
            "quantity" => options[:quantity],
            "type" => options[:type]
          }

          ip["comments"] = options[:comments] if options[:comments]

          request(
            :expects => [201],
            :method => "POST",
            :path => "/projects/" + project_id + "/ips",
            :body => Fog::JSON.encode(ip)
          )
        end
      end

      # Mock
      class Mock
        def reserve_ip(_project_id, _options)
          response = Excon::Response.new
          response.status = 201
          response.body = {
            "id" => "8f65b7eb-80a5-4df0-a87d-030d1b0d3b77"
          }
          response
        end
      end
    end
  end
end
