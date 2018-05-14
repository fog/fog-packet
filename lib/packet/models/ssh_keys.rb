require_relative "ssh_key"

module Fog
  module Compute
    class Packet
      # SshKeys Collection
      class SshKeys < Fog::Collection
        model Fog::Compute::Packet::SshKey

        def all(project_id = "", include = "")
          response = service.list_ssh_keys(project_id, include)
          load(response.body["ssh_keys"])
        end

        def get(id)
          response = service.get_ssh_key(id)
          new(response.body)
        end
      end
    end
  end
end
