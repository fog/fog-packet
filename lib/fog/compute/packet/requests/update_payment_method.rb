module Fog
  module Compute
    class Packet
      # Real
      class Real
        def update_payment_method(id, options)
          payment_method = {}
          payment_method["name"] = options[:name] if options[:name]
          payment_method["cardholder_name"] = options[:cardholder_name] if options[:cardholder_name]
          payment_method["expiration_month"] = options[:expiration_month] if options[:expiration_month]
          payment_method["expiration_year"] = options[:expiration_year] if options[:expiration_year]

          request(
            :expects => [200],
            :method => "POST",
            :path => "/payment_methods/" + id,
            :body => Fog::JSON.encode(payment_method)
          )
        end
      end

      # Mock
      class Mock
        def update_payment_method(id, options)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "id" => id,
            "name" => options[:name],
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
            "expiration_month" => options[:expiration_month],
            "expiration_year" => options[:expiration_year],
            "last_4" => "5045",
            "cardholder_name" => options["cardholder_name"],
            "billing_address" => {
              "street_address" => nil,
              "postal_code" => "10007",
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
