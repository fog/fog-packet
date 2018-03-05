module Fog
  module Compute
    class Packet
      class Real
        def create_project(options)
          project = {
              'name' => options[:name],
              'payment_method_id' => options[:payment_method_id]
          }

          request(
              :expects => [201],
              :method => 'POST',
              :path => '/projects',
              :body => Fog::JSON.encode(project)
          )
        end
      end

      class Mock
        def create_project(options)
          response = Excon::Response.new
          response.status = 201
          response
        end
      end
    end
  end
end
