module Fog
  module Compute
    class Packet
      # Event Model
      class Event < Fog::Model
        identity :id

        attribute :error_messages
        attribute :state
        attribute :type
        attribute :body
        attribute :relationships
        attribute :interpolated
        attribute :href
        attribute :created_at

        def initialize(attributes = {})
          super
        end
      end
    end
  end
end
