require_relative "invitation"

module Fog
  module Compute
    class Packet
      # Invitations Collection
      class Invitations < Fog::Collection
        model Fog::Compute::Packet::Invitation

        def all(project_id, params = {})
          response = service.list_invitations(project_id, params)
          load(response.body["invitations"])
        end

        def get(id)
          response = service.get_notification(id)
          new(response.body)
        end
      end
    end
  end
end
