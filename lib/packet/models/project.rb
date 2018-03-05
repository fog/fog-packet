module Fog
  module Compute
    class Packet
      class Project < Fog::Model
        identity :id
        attribute :name
        attribute :created_at
        attribute :updated_at
        attribute :network_status
        attribute :max_devices
        attribute :organization
        attribute :memebers
        attribute :memeberships
        attribute :devices
        attribute :ssh_keys
        attribute :transfers
        attribute :volumes
        attribute :href

        attr_accessor :options

        def initialize(attributes = {})
          super
        end

      end
    end
  end
end
