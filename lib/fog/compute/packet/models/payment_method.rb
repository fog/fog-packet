module Fog
  module Compute
    class Packet
      # PaymentMethod Model
      class PaymentMethod < Fog::Model
        identity :id

        attribute :name
        attribute :type
        attribute :default
        attribute :created_at
        attribute :updated_at
        attribute :card_type
        attribute :expiration_month
        attribute :expiration_year
        attribute :cardholder_name
        attribute :billing_address
        attribute :email
        attribute :created_by_user
        attribute :organization
        attribute :projects
        attribute :nonce
        attribute :organization_id

        def initialize(attributes = {})
          super
        end

        def save
          requires :organization_id, :nonce, :name
          options = {
            :name => name,
            :nonce => nonce
          }
          options[:default] = default if default
          response = service.create_payment_method(organization_id, options)

          merge_attributes(response.body)
        end

        def update
          requires :id
          options = {}
          options[:name] = options["name"] if options["name"]
          options[:cardholder_name] = options["cardholder_name"] if options["cardholder_name"]
          options[:expiration_month] = options["expiration_month"] if options["expiration_month"]
          options[:expiration_year] = options["expiration_year"] if options["expiration_year"]

          response = service.update_payment_method(id, options)

          merge_attributes(response.body)
        end

        def destroy
          requires :id

          response = service.delete_payment_method(id)
          true if response.status == 204
        end
      end
    end
  end
end
