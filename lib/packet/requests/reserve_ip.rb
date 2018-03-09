module Fog
  module Compute
    class Packet
      class Real
        def reserve_ip(project_id, options)
          ip = {
              'facility' => options[:facility],
              'quantity' => options[:quantity],
              'type' => options[:type]
          }

          ip['comments'] = options[:comments] if options[:comments]

          request(
            expects: [201],
            method: 'POST',
            path: '/projects/' + project_id + '/ips',
            body: Fog::JSON.encode(ip)
          )
        end
      end

      class Mock
        def reserve_ip(project_id, options)
          response = Excon::Response.new
          response.status = 201
          response
        end
      end
    end
  end
end
