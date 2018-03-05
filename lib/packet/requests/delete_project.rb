module Fog
  module Compute
    class Packet
      class Real
        def delete_project(id)
          request(
              :expects => [204],
              :method => 'DELETE',
              :path => '/projects/#{id}'
          )
        end
      end

      class Mock
        def delete_project(id)
          response = Excon::Response.new
          response.status = 204
          response
        end
      end
    end
  end
end
