module Fog
  module Compute
    class Packet
      # Membership Model
      class Membership < Fog::Model
        identity :id

        attribute :error_messages
        attribute :roles
        attribute :user
        attribute :project
        attribute :href
        attribute :created_at
        attribute :updated_at

        def initialize(attributes = {})
          super
        end

        def update
          requires :id
          options = {
            :roles => roles
          }

          response = service.update_membership(id, options)
          merge_attributes(response.body) if response.status == 200
        end

        def destroy
          requires :id
          response = service.delete_membership(id)
          true if response.status == 204
        end
      end
    end
  end
end
