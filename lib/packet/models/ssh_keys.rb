require_relative "ssh_key"

module Fog
  module Compute
    class Packet
      # SshKeys Collection
      class SshKeys < Fog::Collection
        model Fog::Compute::Packet::SshKey

        def all(project_id = "")
          response = service.list_ssh_keys(project_id)
          load(response.body["ssh_keys"])
        end

        def get(id)
          response = service.get_ssh_key(id)
          new(response.body)
        rescue Excon::Errors::NotFound
          nil
        end
      end
    end
  end
end
