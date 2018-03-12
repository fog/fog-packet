module Fog
  module Compute
    class Packet
      class Snapshot < Fog::Model
        identity :id

        attribute :status
        attribute :timestamp
        attribute :created_at
        attribute :volume

        def initialize(attributes = {})
          super
        end

        def save(storage_id)

          data = service.create_snapshot(storage_id)
          true
        end

        def destroy(volume_id)
          requires :id

          data = service.delete_snapshot(volume_id, id)
          true
        end
      end
    end
  end
end
