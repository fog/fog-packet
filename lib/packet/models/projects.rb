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

        def get(id)
          response = service.get_project(id)
          load(response.body)
        end
      end
    end
  end
end
