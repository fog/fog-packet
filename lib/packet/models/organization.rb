module Fog
  module Compute
    class Packet
      # Organization Model
      class Organization < Fog::Model
        identity :id

        attribute :name
        attribute :description
        attribute :website
        attribute :twitter
        attribute :logo
        attribute :created_at
        attribute :updated_at
        attribute :projects
        attribute :members
        attribute :memberships
        attribute :address
        attribute :entitlement
        attribute :terms
        attribute :credit_amount
        attribute :customdata

        def initialize(attributes = {})
          super
        end

        def save
          requires :name

          options = {}
          options[:name] = name

          options[:description] = description if description
          options[:website] = website if website
          options[:twitter] = twitter if twitter
          options[:logo] = website if logo
          options[:address] = address if address
          options[:customdata] = customdata if customdata

          response = service.create_organization(options)

          merge_attributes(response.body)
          true
        end

        def update
          requires :id
          options = {}

          options[:name] = name if name
          options[:description] = description if description
          options[:website] = website if website
          options[:twitter] = twitter if twitter
          options[:logo] = website if logo
          options[:address] = address if address
          options[:customdata] = customdata if customdata

          response = service.update_organization(id, options)
          merge_attributes(response.body)
        end

        def destroy
          requires :id
          response = service.delete_organization(id)
          true if response.status == 204
        end
      end
    end
  end
end
