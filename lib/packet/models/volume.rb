module Fog
  module Compute
    class Packet
      # Volume Model
      class Volume < Fog::Model
        identity :id

        attribute :name
        attribute :description
        attribute :size
        attribute :locked
        attribute :billing_cycle
        attribute :state
        attribute :created_at
        attribute :updated_at
        attribute :access
        attribute :project
        attribute :facility
        attribute :snapshot_policies
        attribute :attachments
        attribute :snapshots
        attribute :plan
        attribute :spot_price_max
        attribute :termination_time
        attribute :href

        def initialize(attributes = {})
          super
        end

        def save
          requires :facility, :plan, :size

          options = {}
          options[:size] = size
          options[:facility] = facility
          options[:plan] = plan
          options[:description] = description if description
          options[:billing_cycle] = billing_cycle if billing_cycle
          options[:snapshot_policies] = snapshot_policies if snapshot_policies

          service.create_volume(options)
          true
        end

        def attach(device_id)
          requires :id

          service.attach_volume(id, device_id)
          true
        end

        def detach
          requires :id

          service.detach_volume(id)
          true
        end

        def destroy
          requires :id

          service.delete_volume(id)
          true
        end

        def reload
          requires :id

          data = service.get_volume(id)

          return unless data
          self
        end
      end
    end
  end
end
