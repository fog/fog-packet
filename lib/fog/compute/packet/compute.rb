module Fog
  module Compute
    # Packet
    class Packet < Fog::Service
      API_VERSION = "v1".freeze

      SUCCESS_CODES = [200, 201, 202, 204].freeze

      recognizes :packet_token

      recognizes :packet_url

      # Models
      model_path "fog/compute/packet/models"

      model :plan
      collection :plans

      model :project
      collection :projects

      model :facility
      collection :facilities

      model :device
      collection :devices

      model :project
      collection :projects

      model :operating_system
      collection :operating_systems

      model :ip
      collection :ips

      model :snapshot
      collection :snapshots

      model :volume
      collection :volumes

      model :virtual_network
      collection :virtual_networks

      model :ssh_key
      collection :ssh_keys

      model :email
      collection :emails

      model :user
      collection :users

      model :vpn
      collection :vpns

      model :spot_market_price
      collection :spot_market_prices

      model :batch
      collection :batches

      model :bgp_session
      collection :bgp_sessions

      model :event
      collection :events

      collection :two_factor_auth

      model :session
      collection :sessions

      model :notification
      collection :notifications

      model :invitation
      collection :invitations

      collection :email_verification
      collection :bandwidth

      model :license
      collection :licenses

      model :membership
      collection :memberships

      model :organization
      collection :organizations

      model :capacity
      collection :capacities

      model :payment_method
      collection :payment_methods

      model :transfer_request
      collection :transfer_requests

      model :hardware_reservation
      collection :hardware_reservations

      # Requests
      request_path "fog/compute/packet/requests"

      request :list_plans
      request :list_projects
      request :get_project
      request :create_project
      request :delete_project
      request :list_facilities
      request :list_operating_systems

      request :create_device
      request :list_devices
      request :get_device
      request :delete_device
      request :update_device
      request :reboot_device
      request :poweron_device
      request :poweroff_device

      request :get_volume
      request :create_volume
      request :list_volumes
      request :delete_volume
      request :attach_volume
      request :detach_volume
      request :update_volume

      request :reserve_ip
      request :get_ip
      request :list_ips
      request :assign_ip
      request :unassign_ip
      request :create_snapshot
      request :delete_snapshot
      request :list_snapshots

      request :create_virtual_network
      request :list_virtual_networks
      request :delete_virtual_network
      request :assign_port
      request :unassign_port
      request :disbond_ports
      request :bond_ports

      request :list_ssh_keys
      request :create_ssh_key
      request :get_ssh_key
      request :delete_ssh_key
      request :update_ssh_key

      request :create_email
      request :get_email
      request :update_email
      request :delete_email

      request :list_users
      request :get_user
      request :update_user

      request :enable_vpn
      request :disable_vpn
      request :get_vpn

      request :list_spotmarketprices
      request :list_spotmarketprices_history

      request :list_batches
      request :get_batch
      request :create_batch

      request :create_bgp_session
      request :delete_bgp_session
      request :get_bgp_session
      request :list_bgp_sessions

      request :list_events

      request :enable_two_factor_auth
      request :disable_two_factor_auth

      request :list_sessions
      request :delete_session
      request :session_login

      request :list_notifications
      request :get_notification
      request :update_notification

      request :list_invitations
      request :get_invitation
      request :accept_invitation
      request :decline_invitation

      request :request_email_verification
      request :verify_email

      request :get_bandwidth

      request :list_licenses
      request :create_license
      request :get_license
      request :update_license
      request :delete_license

      request :list_memberships
      request :get_membership
      request :update_membership
      request :delete_membership

      request :list_organizations
      request :get_organization
      request :create_organization
      request :delete_organization
      request :update_organization

      request :get_capacity
      request :validate_capacity

      request :list_payment_methods
      request :create_payment_method
      request :update_payment_method
      request :get_payment_method
      request :delete_payment_method

      request :list_transfer_requests
      request :transfer_project
      request :get_transfer_request
      request :accept_transfer_request
      request :decline_transfer_request

      request :list_hardware_reservations
      request :get_hardware_reservation
      request :move_hardware_reservation

      # Real
      class Real
        def initialize(options = {})
          if options[:packet_token] 
            @packet_token = options[:packet_token]
          else
            @packet_token = ENV["PACKET_TOKEN"]
          end

          raise "Packet token is not present. Please pass it as an argument or set environment variable 'PACKET_TOKEN'." unless @packet_token

          @base_url = options[:packet_url] ? options[:packet_url] : "https://api.packet.net/" 
          @version = ""

          @header = {
            "X-Auth-Token" => @packet_token,
            "Content-Type" => "application/json"
          }
          @connection = Fog::Core::Connection.new(@base_url)
        end

        def request(params)
          # Perform Request

          begin
            response = @connection.request(:method => params[:method],
                                           :path => params[:path],
                                           :headers => @header,
                                           :body => params[:body],
                                           :query => params[:params])
          rescue Excon::Errors::Unauthorized => error
            raise error
          rescue Excon::Errors::HTTPStatusError => error
            raise error
          rescue Excon::Errors::InternalServerError => error
            raise error
          rescue Fog::Errors::NotFound => error
            raise error
          end

          # Parse body
          response.body = Fog::JSON.decode(response.body) if response.body != ""

          #
          # Check for server error
          if response.status == 500
            raise "Internal Server Error. Please try again."
          end
          # Raise exception if a bad status code is returned
          unless SUCCESS_CODES.include? response.status
            raise response.status.to_s + " " + response.body.to_s
          end

          response
        end
      end

      # Mock
      class Mock
        def initialize(options = {})
          if options[:packet_token]
            @packet_token = options[:packet_token]
          else
            @packet_token = ENV["PACKET_TOKEN"]
          end
          raise "Packet token is not present. Please pass it as an argument or set environment variable 'PACKET_TOKEN'." unless @packet_token
          @base_url = options[:packet_url] ? options[:packet_url] : "https://api.packet.net/"
        end

        def data
          self.class.data[@packet_token]
        end
      end
    end
  end
end
