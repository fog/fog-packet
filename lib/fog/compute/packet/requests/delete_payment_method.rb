module Fog
  module Compute
    class Packet
      # Real
      class Real
        def delete_payment_method(id)
          request(
            :expects => [204],
            :method => "DELETE",
            :path => "/payment-methods/" + id
          )
        end
      end

      # Mock
      class Mock
        def delete_payment_method(_id)
          response = Excon::Response.new
          response.status = 204
          response
        end
      end
    end
  end
end
