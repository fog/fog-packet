require_relative "session"

module Fog
  module Compute
    class Packet
      # Sessions Collection
      class Sessions < Fog::Collection
        model Fog::Compute::Packet::Session
        def login(login_params)
          service.session_login(login_params)
          true
        end

        def all
          response = service.list_sessions
          load(response.body["sessions"])
        end

        def delete(session_id = "")
          response = service.delete_session(session_id)
          true if response.status == 204
        end
      end
    end
  end
end
