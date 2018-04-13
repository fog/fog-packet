module Fog
  module Compute
    class Packet
      # Invitation Model
      class Invitation < Fog::Model
        identity :id

        attribute :roles
        attribute :invitee
        attribute :invited_by
        attribute :invitable
        attribute :created_at
        attribute :updated_at
        attribute :href

        def initialize(attributes = {})
          super
        end

        def accept
          requires :id

          response = service.accept_invitation(id)
          merge_attributes(response.body)
        end

        def decline
          requires :id

          response = service.decline_invitation(id)
          merge_attributes(response.body)
        end
      end
    end
  end
end
