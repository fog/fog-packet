require_relative "ip"

module Fog
  module Compute
    class Packet
      # Ips Collection
      class Ips < Fog::Collection
        model Fog::Compute::Packet::Ip

        def all(project_id)
          response = service.list_ips(project_id)
          load(response.body["ip_addresses"])
        end

        def get(id)
          response = service.get_ip(id)
          new(response.body)
        end
      end
    end
  end
end
