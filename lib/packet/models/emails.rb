require_relative "email"

module Fog
  module Compute
    class Packet
      # Projects Collection
      class Emails < Fog::Collection
        model Fog::Compute::Packet::Email

        def get(id)
          response = service.get_email(id)
          new(response.body)
        rescue Excon::Errors::NotFound
          nil
        end
      end
    end
  end
end
