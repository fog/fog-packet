module Fog
  module Compute
    class Packet
      # Real
      class Real
        def create_payment_method(org_id, options)
          payment_method = {
            "name" => options[:name]
          }
          payment_method["default"] = options[:default] if options[:default]
          payment_method["nonce"] = options[:nonce] if options[:nonce]

          request(
            :expects => [201],
            :method => "POST",
            :path => "/organizations/" + org_id + "/payment_methods",
            :body => Fog::JSON.encode(payment_method)
          )
        end
      end

      # Mock
      class Mock
        def create_payment_method(_org_id, _options)
          response = Excon::Response.new
          response.status = 201
          response.body = {
            "id" => "7605f76e-17d4-4356-833c-91a273aba7f0",
            "name" => "John Doe",
            "type" => "credit_card",
            "default" => true,
            "created_at" => "2018-02-20T03:59:06Z",
            "updated_at" => "2018-02-20T03:59:13Z",
            "created_by_user" => {
              "href" => "/users/8f23cd1f-09e0-4539-9524-6387e4f8d44d"
            },
            "projects" => [
              {
                "href" => "/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
              }
            ],
            "organization" => {
              "href" => "/organizations/6c17df6c-8769-4d98-b01f-f2848b6489a1"
            },
            "card_type" => "American Express",
            "expiration_month" => "10",
            "expiration_year" => "2020",
            "last_4" => "1234",
            "cardholder_name" => "John Doe",
            "billing_address" => {
              "street_address" => nil,
              "postal_code" => "12345",
              "country_code_alpha2" => "US"
            },
            "href" => "/payment-methods/7605f76e-17d4-4356-833c-91a273aba7f0"
          }

          response
        end
      end
    end
  end
end
