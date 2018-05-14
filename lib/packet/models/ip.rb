module Fog
  module Compute
    class Packet
      # Ip Model
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
        attribute :project_id
        attribute :quantity
        attribute :type
        attribute :facility

        def initialize(attributes = {})
          super
        end

        def save
          requires :project_id, :facility, :type, :quantity

          options = {}
          options[:quantity] = quantity
          options[:type] = type
          options[:facility] = facility
          response = service.reserve_ip(project_id, options)

          merge_attributes(response.body)
        end

        def assign(device_id)
          requires :address, :manageable

          options = {}
          options[:address] = address
          options[:manageable] = manageable

          response = service.assign_ip(device_id, options)
          true if response.status == 201
        end

        def unassign
          response = service.unassign_ip(id)
          true if response.status == 204
        end
      end
    end
  end
end
