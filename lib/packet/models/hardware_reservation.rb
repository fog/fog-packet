module Fog
  module Compute
    class Packet
      # HardwareReservation Model
      class HardwareReservation < Fog::Model
        identity :id

        attribute :short_id
        attribute :hostname
        attribute :facility
        attribute :plan
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
        attribute :address
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
        attribute :image_url
        attribute :user
        attribute :iqn
        attribute :bonding_mode
        attribute :customdata
        attribute :location
        attribute :project_lite
        attribute :ssh_keys

        def initialize(attributes = {})
          super
        end

        def move(project_id)
          requires :id

          response = service.move_hardware_reservation(id, project_id)
          true if response.status == 200
        end
      end
    end
  end
end
