module Fog
  module Compute
    class Packet
      # Plan
      class VirtualNetwork < Fog::Model
        identity :id

        attribute :name
        attribute :description
        attribute :vxlan
        attribute :created_at
        attribute :internet_gateway
        attribute :facility
        attribute :instances
        attribute :assigned_to
        attribute :facility_code
        attribute :href
        attribute :vlan
        attribute :project_id

        attr_accessor :options

        def initialize(attributes = {})
          super
        end

        def save
          requires :project_id, :description, :facility, :vxlan, :vlan

          options = {}
          options [:project_id] = project_id
          options[:description] = description
          options[:facility] = facility
          options[:vxlan] = vxlan
          options[:vxlan] = vlan
          options[:name] = name if name

          response = service.create_virtual_network(options)
          merge_attributes(response.body)
        end

        def bond(bulk_enable)
          requires :id
          service.bond_ports(id, bulk_enable)
          true
        end

        def disbond(bulk_disable)
          requires :id
          service.disbond_ports(id, bulk_disable)
          true
        end

        def assign_port(port_id)
          requires :id

          service.assign_port(port_id, id)
          true
        end

        def unassign_port(port_id)
          requires :id

          service.unassign_port(port_id, id)
          true
        end

        def destroy
          requires :id
          service.delete_virtual_network(id)
          true
        end
      end
    end
  end
end
