module Fog
  module Compute
    class Packet
      # Email
      class Email < Fog::Model
        identity :id

        attribute :address
        attribute :default
        attribute :href

        attr_accessor :options

        def initialize(attributes = {})
          super
        end

        def save
          requires :address

          options = {}
          options[:address] = address
          options[:default] = default

          response = service.create_email(options)
          merge_attributes(response.body)
        end

        def update
          requires :id

          options = {}
          options[:address] = address
          options[:default] = default

          response = service.update_email(id, options)

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
