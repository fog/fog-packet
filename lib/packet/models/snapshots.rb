require_relative "snapshot"

module Fog
  module Compute
    class Packet
      # Volumes
      class Snapshots < Fog::Collection
        model Fog::Compute::Packet::Snapshot

        def all(volume_id)
          response = service.list_snapshots(volume_id)
          load(response.body["snapshots"])
        end

        def get(id)
          response = service.get_volume(id)
          load(response.body)
        end
      end
    end
  end
end
