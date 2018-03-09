module Fog
  module Compute
    class Packet
      class Device < Fog::Model
        identity :id

        attribute :status
        attribute :timestamp
        attribute :created_at
        attribute :volume

        def initialize(attributes = {})
          super
        end
      end
    end
  end
end
