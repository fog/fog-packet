module Fog
  module Compute
    class Packet
      # Notification Model
      class Notification < Fog::Model
        identity :id

        attribute :type
        attribute :body
        attribute :severity
        attribute :read
        attribute :context
        attribute :created_at
        attribute :updated_at
        attribute :user
        attribute :href

        def initialize(attributes = {})
          super
        end

        def update
          requires :id

          response = service.update_notification(id)
          merge_attributes(response.body)
        end
      end
    end
  end
end
