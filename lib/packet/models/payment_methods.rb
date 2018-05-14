require_relative "payment_method"

module Fog
  module Compute
    class Packet
      # PaymentMethods
      class PaymentMethods < Fog::Collection
        model Fog::Compute::Packet::PaymentMethod

        def all(org_id, params = {})
          response = service.list_payment_methods(org_id, params)
          load(response.body["payment_methods"])
        end

        def get(id)
          response = service.get_payment_method(id)
          new(response.body)
        end
      end
    end
  end
end
