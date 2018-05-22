require_relative "organization"

module Fog
  module Compute
    class Packet
      # Plans
      class Organizations < Fog::Collection
        model Fog::Compute::Packet::Organization

        def all(params = {})
          response = service.list_organizations(params)
          load(response.body["organizations"])
        end

        def get(id)
          response = service.get_organization(id)
          new(response.body)
        end
      end
    end
  end
end
