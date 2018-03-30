module Fog
  module Compute
    class Packet
      # User
      class User < Fog::Model
        identity :id

        attribute :short_id
        attribute :first_name
        attribute :last_name
        attribute :full_name
        attribute :email
        attribute :social_accounts
        attribute :created_at
        attribute :updated_at
        attribute :default_organization_id
        attribute :avatar_url
        attribute :avatar_thumb_url
        attribute :timezone
        attribute :verification_stage
        attribute :two_factor_auth
        attribute :max_projects
        attribute :vpn
        attribute :last_login_at
        attribute :emails
        attribute :href
        attribute :phone_number
        attribute :restricted
        attribute :avatar
        attribute :password

        attr_accessor :options

        def initialize(attributes = {})
          super
        end

        def update
          requires :id

          options = {}
          options[:first_name] = first_name if first_name
          options[:last_name] = last_name if last_name
          options[:phone_number] = phone_number if phone_number
          options[:timezone] = timezone if timezone
          options[:password] = password if password
          options[:avatar] = avatar if avatar

          response = service.update_user(id, options)

          merge_attributes(response.body)
        end

        def destroy
          requires :id

          service.delete_email(id)
          true
        end
      end
    end
  end
end
