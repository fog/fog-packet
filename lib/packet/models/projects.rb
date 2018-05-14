require_relative "project"

module Fog
  module Compute
    class Packet
      # Projects Collection
      class Projects < Fog::Collection
        model Fog::Compute::Packet::Project

        def all(params = {})
          response = service.list_projects(params)
          load(response.body["projects"])
        end

        def get(id)
          response = service.get_project(id)
          new(response.body)
        end
      end
    end
  end
end
