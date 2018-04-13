module Fog
  module Compute
    class Packet
      # Session Model
      class Session < Fog::Model
        identity :id

        attribute :token
        attribute :expires_at
        attribute :user
        attribute :created_at
        attribute :updated_at

        attr_accessor :options

        def initialize(attributes = {})
          super
        end
      end
    end
  end
end
