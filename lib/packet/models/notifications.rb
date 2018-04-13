require_relative "notification"

module Fog
  module Compute
    class Packet
      # Notifications Collection
      class Notifications < Fog::Collection
        model Fog::Compute::Packet::Notification

        def all
          response = service.list_notifications
          load(response.body["notifications"])
        end

        def get(id)
          response = service.get_notification(id)
          new(response.body)
        end
      end
    end
  end
end
