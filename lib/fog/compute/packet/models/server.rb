module Fog
  module Compute
    class Packet
      # Server Model
      class Server < Fog::Compute::Server
        identity :id

        attribute :short_id
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

        def save
          requires :project_id, :facility, :plan, :hostname, :operating_system

          options = {}
          options[:plan] = plan
          options[:facility] = facility
          options[:hostname] = hostname
          options[:operating_system] = operating_system

          options[:description] = description if description
          options[:billing_cycle] = billing_cycle if billing_cycle
          options[:always_pxe] = always_pxe if always_pxe
          options[:ipxe_script_url] = ipxe_script_url if ipxe_script_url
          options[:userdata] = userdata if userdata
          options[:locked] = locked if locked
          options[:hardware_reservation_id] = hardware_reservation_id if hardware_reservation_id
          options[:spot_instance] = spot_instance if spot_instance
          options[:spot_price_max] = spot_price_max if spot_price_max
          options[:termination_time] = termination_time if termination_time
          options[:tags] = tags if tags
          options[:project_ssh_keys] = project_ssh_keys if project_ssh_keys
          options[:user_ssh_keys] = user_ssh_keys if user_ssh_keys
          options[:features] = features if features

          response = service.create_device(project_id, options)
          merge_attributes(response.body)
        end

        def public_ip_address
          ip_addresses[0]["address"]
        end

        def update
          requires :id

          options = {}
          options[:hostname] = hostname if hostname
          options[:description] = description if description
          options[:billing_cycle] = billing_cycle if billing_cycle
          options[:userdata] = userdata if userdata
          options[:locked] = locked if locked
          options[:tags] = tags if tags
          options[:always_pxe] = always_pxe if always_pxe
          options[:ipxe_script_url] = ipxe_script_url if ipxe_script_url
          options[:spot_instance] = spot_instance if spot_instance

          response = service.update_device(id, options)
          merge_attributes(response.body)
        end

        def reboot
          requires :id
          response = service.reboot_device(id)
          true if response.status == 202
        end

        def start
          requires :id
          response = service.poweron_device(id)
          true if response.status == 202
        end

        def stop
          requires :id
          response = service.poweroff_device(id)
          true if response.status == 202
        end

        def destroy
          requires :id

          response = service.delete_device(id)
          true if response.status == 204
        end

        def reload
          requires :id
          response = service.get_device(id)
          return unless response.body
          merge_attributes(response.body)
        end

        def ready?
          state == "active"
        end

        def inactive?
          state == "inactive"
        end
      end
    end
  end
end
