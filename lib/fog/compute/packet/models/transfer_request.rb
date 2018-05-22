module Fog
  module Compute
    class Packet
      # TransferRequest Model
      class TransferRequest < Fog::Model
        identity :id

        attribute :target_organization
        attribute :state
        attribute :created_at
        attribute :updated_at
        attribute :href

        def initialize(attributes = {})
          super
        end

        def accept
          requires :id

          response = service.accept_transfer_request(id)
          true if response.status == 204
        end

        def decline
          requires :id

          response = service.decline_transfer_request(id)
          true if response.status == 204
        end
      end
    end
  end
end
