require_relative "license"

module Fog
  module Compute
    class Packet
      # Licenses Collection
      class Licenses < Fog::Collection
        model Fog::Compute::Packet::License

        def all(project_id)
          response = service.list_licenses(project_id)
          load(response.body["licenses"])
        end

        def get(id)
          response = service.get_license(id)
          new(response.body)
        end
      end
    end
  end
end
