require_relative "batch"

module Fog
  module Compute
    class Packet
      # Batches Collection
      class Batches < Fog::Collection
        model Fog::Compute::Packet::Batch

        def all(project_id)
          response = service.list_batches(project_id)
          load(response.body["batches"])
        end

        def get(id)
          response = service.get_batch(id)
          new(response.body)
        end

        def create(project_id, batches)
          response = service.create_batch(project_id, batches)
          load(response.body["batches"])
        end
      end
    end
  end
end
