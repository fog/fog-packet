module Fog
  module Compute
    class Packet
      # BgpSession Model
      class BgpSession < Fog::Model
        identity :id

        attribute :status
        attribute :learned_routes
        attribute :switch_name
        attribute :created_at
        attribute :device
        attribute :address_family
        attribute :href
        attribute :device_id

        def initialize(attributes = {})
          super
        end

        def save
          requires :device_id, :address_family
          response = service.create_bgp_session(device_id, address_family)
          merge_attributes(response.body)
        end

        def destroy
          requires :id
          response = service.delete_bgp_session(id)
          true if response.status == 204
        end
      end
    end
  end
end
