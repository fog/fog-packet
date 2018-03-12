module Fog
  module Compute
    class Packet
      class Real
        def delete_virtual_network(id)
          request(
            expects: [204],
            method: 'DELETE',
            path: '/virtual-networks/' + id
          )
        end
      end

      class Mock
        def delete_virtual_network(id)
          response = Excon::Response.new
          response.status = 204
          response
        end
      end
    end
  end
end
