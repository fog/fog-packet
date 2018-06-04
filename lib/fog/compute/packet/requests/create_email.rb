module Fog
  module Compute
    class Packet
      # Real
      class Real
        def create_email(options)
          email = {
            "address" => options[:address],
            "default" => options[:default]
          }

          request(
            :expects => [201],
            :method => "POST",
            :path => "/emails",
            :body => Fog::JSON.encode(email)
          )
        end
      end

      # Mock
      class Mock
        def create_email(options)
          response = Excon::Response.new
          response.status = 201
          response.body = {
            "id" => "1de4d14d-1c3e-4f33-b39a-2551af108f7e",
            "address" => options[:address],
            "default" => false,
            "href" => "/emails/1de4d14d-1c3e-4f33-b39a-2551af108f7e"
          }

          response
        end
      end
    end
  end
end
