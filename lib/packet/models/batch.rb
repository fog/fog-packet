module Fog
  module Compute
    class Packet
      # Batch Model
      class Batch < Fog::Model
        identity :id

        attribute :error_messages
        attribute :state
        attribute :created_at
        attribute :updated_at
        attribute :devices
        attribute :project
        attribute :quantity

        def initialize(attributes = {})
          super
        end
      end
    end
  end
end
