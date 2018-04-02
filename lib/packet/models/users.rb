require_relative "user"

module Fog
  module Compute
    class Packet
      # Projects Collection
      class Users < Fog::Collection
        model Fog::Compute::Packet::User

        def all
          response = service.list_users
          load(response.body["users"])
        end

        def get(id = "")
          response = service.get_user(id)
          new(response.body)
        rescue Excon::Errors::NotFound
          nil
        end
      end
    end
  end
end
