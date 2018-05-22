require_relative "transfer_request"

module Fog
  module Compute
    class Packet
      # TransferRequests Collection
      class TransferRequests < Fog::Collection
        model Fog::Compute::Packet::TransferRequest

        def all(organization_id, params = {})
          response = service.list_transfer_requests(organization_id, params)
          load(response.body["transfers"])
        end

        def get(id)
          response = service.get_transfer_request(id)
          new(response.body)
        end

        def transfer(project_id, organization_id)
          response = service.transfer_project(project_id, organization_id)
          new(response.body)
        end
      end
    end
  end
end
