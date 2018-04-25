require_relative "membership"

module Fog
  module Compute
    class Packet
      # Memberships Collection
      class Memberships < Fog::Collection
        model Fog::Compute::Packet::Membership

        def all(project_id)
          response = service.list_memberships(project_id)
          load(response.body["memberships"])
        end

        def get(id)
          response = service.get_membership(id)
          new(response.body)
        end
      end
    end
  end
end
