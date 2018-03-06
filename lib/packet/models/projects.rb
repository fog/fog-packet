require_relative 'project'

module Fog
  module Compute
    class Packet
      class Projects < Fog::Collection
        model Fog::Compute::Packet::Project

        def all
          response = service.list_projects
          load(response.body)
        end
      end
    end
  end
end
