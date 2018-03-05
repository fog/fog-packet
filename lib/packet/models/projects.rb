require_relative 'project'

module Fog
  module Compute
    class Packet
      class Projects < Fog::Collection
        model Fog::Compute::Packet::Project

        def all
          response = service.list_block_storages
          load(response.body)
        end

        def get(id)
          response = service.get_block_storage(id)
          new(response.body)
          rescue Excon::Errors::NotFound
          nil
        end
      end
    end
  end
end
