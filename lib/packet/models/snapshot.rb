module Fog
  module Compute
    class Packet
      # Snapshot
      class Snapshot < Fog::Model
        identity :id

        attribute :status
        attribute :timestamp
        attribute :created_at
        attribute :volume
        attribute :storage_id

        def initialize(attributes = {})
          super
        end

        def save
          requires :storage_id
          service.create_snapshot(storage_id)
          true
        end

        def destroy(volume_id)
          requires :id

          service.delete_snapshot(volume_id, id)
          true
        end
      end
    end
  end
end
