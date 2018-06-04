module Fog
  module Compute
    class Packet
      # Real
      class Real
        def delete_ssh_key(id)
          request(
            :expects => [204],
            :method => "DELETE",
            :path => "/ssh-keys/" + id
          )
        end
      end

      # Mock
      class Mock
        def delete_ssh_key(_id)
          response = Excon::Response.new
          response.status = 204
          response
        end
      end
    end
  end
end
