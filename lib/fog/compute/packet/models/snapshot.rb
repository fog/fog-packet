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
          response = service.create_snapshot(storage_id)
          true if response.status == 202
        end

        def destroy
          requires :id
    
          volume_id = volume["href"].split("/")[-1]
          response = service.delete_snapshot(volume_id, id)
          true if response.status == 204
        end
      end
    end
  end
end
