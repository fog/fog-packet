require_relative "user"

module Fog
  module Compute
    class Packet
      # Projects Collection
      class Users < Fog::Collection
        model Fog::Compute::Packet::User

        def all(params = {})
          response = service.list_users(params)
          load(response.body["users"])
        end

        def get(id = "")
          response = service.get_user(id)
          new(response.body)
        end
      end
    end
  end
end
