module Fog
  module Compute
    class Packet
      # Real
      class Real
        def update_user(user_id, options)
          project = Hash.new {}
          project["first_name"] = options[:first_name] if options[:first_name]
          project["last_name"] = options[:last_name] if options[:last_name]
          project["phone_number"] = options[:phone_number] if options[:phone_number]
          project["timezone"] = options[:timezone] if options[:timezone]
          project["password"] = options[:password] if options[:password]
          project["avatar"] = options[:timezone] if options[:avatar]

          request(
            :expects => [200],
            :method => "PUT",
            :path => "/users/" + user_id,
            :body => Fog::JSON.encode(project)
          )
        end
      end

      # Mock
      class Mock
        def update_user(user_id, options)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "id" => "2dce124f-3220-495c-907e-5bbbd4dda77c",
            "short_id" => "2dce124f",
            "first_name" => "Jane",
            "last_name" => "Doe",
            "full_name" => "Jane Doe",
            "email" => "jdoe@example.net",
            "social_accounts" => {
              "linkedin" => "https://example.net"
            },
            "created_at" => "2018-02-20T19:55:57Z",
            "updated_at" => "2018-03-28T11:32:25Z",
            "default_organization_id" => "602c17ec-f996-4d94-a6a8-20d6356e6c2a",
            "avatar_url" => "https://www.gravatar.com/avatar/0bf989eabc6c8c214e11072b7500e4b2?d=mm",
            "avatar_thumb_url" => "https://www.gravatar.com/avatar/0bf989eabc6c8c214e11072b7500e4b2?d=mm",
            "timezone" => "America/New_York",
            "verification_stage" => "verified",
            "two_factor_auth" => "",
            "max_projects" => 2,
            "vpn" => false,
            "last_login_at" => "2018-03-28T11:36:34Z",
            "emails" => [
              {
                "href" => "/emails/973a189d-5dda-4b69-a038-526472a1b6d4"
              }
            ],
            "href" => "/users/2dce124f-3220-495c-907e-5bbbd4dda77c",
            "phone_number" => "+123456789012",
            "restricted" => false
          }

          response
        end
      end
    end
  end
end
