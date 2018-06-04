module Fog
  module Compute
    class Packet
      # EmailVerification Collection
      class EmailVerification < Fog::Collection
        def request(email)
          response = service.request_email_verification(email)
          true if response.status == 201
        end

        def verify(token)
          response = service.verify_email(token)
          true if response.status == 200
        end
      end
    end
  end
end
