module Fog
  module Compute
    class Packet
      # Real
      class Real
        def update_organization(id, options)
          org = {}
          org["name"] = options[:name] if options[:name]
          org["description"] = options[:description] if options[:description]
          org["website"] = options[:website] if options[:website]
          org["twitter"] = options[:twitter] if options[:twitter]
          org["logo"] = options[:logo] if options[:logo]
          org["address"] = options[:address] if options[:address]
          org["customdata"] = options[:customdata] if options[:customdata]

          request(
            :expects => [200],
            :method => "PUT",
            :path => "/organizations/" + id,
            :body => Fog::JSON.encode(org)
          )
        end
      end

      # Mock
      class Mock
        def update_organization(id, options)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "id" => id,
            "name" => options[:name],
            "description" => options[:description],
            "website" => nil,
            "twitter" => nil,
            "created_at" => "2018-04-25T10:01:21Z",
            "updated_at" => "2018-04-25T10:01:21.134Z",
            "tax_id" => nil,
            "main_phone" => nil,
            "billing_phone" => nil,
            "credit_amount" => 0.0,
            "personal" => true,
            "customdata" => {},
            "address" => nil,
            "members" => [
              {
                "href" => "#2dce124f-3220-495c-907e-5bbbd4dda77c"
              }
            ],
            "owners" => [
              {
                "href" => "/users/2dce124f-3220-495c-907e-5bbbd4dda77c"
              }
            ],
            "memberships" => [
              {
                "href" => "/memberships/95780e18-ad65-4f0a-8895-0da65c371406"
              }
            ],
            "primary_owner" => {
              "href" => "/users/2dce124f-3220-495c-907e-5bbbd4dda77c"
            },
            "inbound_transfers" => [],
            "payment_methods" => [],
            "default_payment_method" => nil,
            "account_manager" => nil,
            "logo" => nil,
            "logo_thumb" => nil,
            "projects" => [],
            "plan" => "Bronze",
            "monthly_spend" => 0.0,
            "current_user_abilities" => {
              "admin" => true,
              "billing" => true,
              "collaborator" => true,
              "owner" => true
            },
            "href" => "/organizations/a24136c3-38e8-46a9-b541-219b4d31bfb1"
          }
          response
        end
      end
    end
  end
end
