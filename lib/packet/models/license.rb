module Fog
  module Compute
    class Packet
      # License Model
      class License < Fog::Model
        identity :id

        attribute :description
        attribute :license_key
        attribute :licensee_product
        attribute :size
        attribute :devices
        attribute :project
        attribute :license_product_id
        attribute :project_id

        def initialize(attributes = {})
          super
        end

        def save
          requires :project_id, :description, :size

          options = {
            :description => description,
            :size => size
          }

          options[:license_product_id] = license_product_id if license_product_id

          response = service.create_license(project_id, options)
          merge_attributes(response.body) if response.status == 201
        end

        def update
          requires :id
          options = {
            :description => description,
            :size => size
          }

          response = service.update_license(id, options)
          merge_attributes(response.body) if response.status == 200
        end

        def destroy
          requires :id

          response = service.delete_license(id)
          true if response.status == 204
        end
      end
    end
  end
end
