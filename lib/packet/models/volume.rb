module Fog
  module Compute
    class Packet
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
      end
    end
  end
end
