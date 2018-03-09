module Fog
  module Compute
    class Packet
      class Ip < Fog::Model
        identity :id
        attribute :address
        attribute :gateway
        attribute :network
        attribute :address_family
        attribute :netmask
        attribute :public
        attribute :cidr
        attribute :created_at
        attribute :updated_at
        attribute :href
        attribute :management
        attribute :manageable
        attribute :project

        def initialize(attributes = {})
          super
        end
      end
    end
  end
end
