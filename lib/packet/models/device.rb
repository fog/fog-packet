module Fog
  module Compute
    class Packet
      class Device < Fog::Model
        identity :id
        attribute :hostname
        attribute :plan
        attribute :facility
        attribute :operating_system
        attribute :billing_cycle
        attribute :project_id
        attribute :userdata
        attribute :storage
        attribute :ipxe_script_url
        attribute :public_ipv4_subnet_size
        attribute :always_pxe
        attribute :hardware_reservation_id
        attribute :spot_instance
        attribute :spot_price_max
        attribute :termination_time
        attribute :description

        attribute :name
        attribute :href
        attribute :state
        attribute :created_at
        attribute :updated_at
        attribute :locked
        attribute :tags
        attribute :ip_addresses
        attribute :volumes
        attribute :project
        attribute :provisioning_events
        attribute :provisioning_percentage
        attribute :root_password
        attribute :hardware_reservation
        attribute :project_ssh_keys
        attribute :network_ports
        attribute :user_ssh_keys
        attribute :features

        def initialize(attributes = {})
          super
        end
      end
    end
  end
end
