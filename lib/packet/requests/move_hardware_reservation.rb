module Fog
  module Compute
    class Packet
      # Real
      class Real
        def move_hardware_reservation(reservation_id, project_id)
          request(
            :expects => [200],
            :method => "POST",
            :path => "/hardware-reservations/" + reservation_id + "/move/" + project_id
          )
        end
      end

      # Mock
      class Mock
        def move_hardware_reservation(_reservation_id, _project_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "id" => "string",
            "roles" => [
              "owner"
            ],
            "invitee" => "jane.doe@example.net",
            "nonce" => "NjxZAa3VYc3qvGhPejakYy4nKkt6S7Ay",
            "created_at" => "2018-04-10T21:13:24Z",
            "updated_at" => "2018-04-10T21:16:10Z",
            "invited_by" => {
              "href" => "/users/2dce124f-3220-495c-907e-5bbbd4dda77c"
            },
            "invitable" => {
              "href" => "/organizations/6c17df6c-8769-4d98-b01f-f2848b6489a1"
            },
            "href" => "/invitations/02797cf6-c36c-474b-9558-37463f2aee26"
          }

          response
        end
      end
    end
  end
end
