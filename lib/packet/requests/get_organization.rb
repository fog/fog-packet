module Fog
  module Compute
    class Packet
      # Real
      class Real
        def get_organization(id, params = {})
          request(
            :expects => [200],
            :method => "GET",
            :path => "/organizations/" + id,
            :params => params
          )
        end
      end

      # Mock
      class Mock
        def get_organization(id, _include = "")
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "id" => id,
            "name" => "Packet Integration Testing",
            "description" => nil,
            "website" => nil,
            "twitter" => nil,
            "created_at" => "2018-02-20T03:56:01Z",
            "updated_at" => "2018-04-24T10:46:37Z",
            "tax_id" => nil,
            "main_phone" => nil,
            "billing_phone" => nil,
            "credit_amount" => 0,
            "personal" => true,
            "customdata" => {},
            "address" => nil,
            "account_manager" => {
              "href" => "/users/8f23cd1f-09e0-4539-9524-6387e4f8d44d"
            },
            "logo" => "/organizations/6c17df6c-8769-4d98-b01f-f2848b6489a1/logos/original?1519098961",
            "logo_thumb" => "/organizations/6c17df6c-8769-4d98-b01f-f2848b6489a1/logos/thumb?1519098961",
            "projects" => [
              {
                "href" => "/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
              }
            ],
            "plan" => "Staff",
            "monthly_spend" => 0,
            "current_user_abilities" => {
              "admin" => true,
              "billing" => true,
              "collaborator" => true,
              "owner" => false
            },
            "href" => "/organizations/6c17df6c-8769-4d98-b01f-f2848b6489a1"
          }
          response
        end
      end
    end
  end
end
