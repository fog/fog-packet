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
        end
      end
    end
  end
end
