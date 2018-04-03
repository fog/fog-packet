module Fog
  module Compute
    class Packet
      # Real
      class Real
        def update_email(email_id, options)
          project = Hash.new {}
          project["address"] = options[:address] if options[:address]
          project["default"] = options[:default] if options[:default]

          request(
            :expects => [200],
            :method => "PUT",
            :path => "/emails/" + email_id,
            :body => Fog::JSON.encode(project)
          )
        end
      end

      # Mock
      class Mock
        def update_email(_email_id, _options)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "id" => "1de4d14d-1c3e-4f33-b39a-2551af108f7e",
            "address" => "jdoe@example.net",
            "default" => false,
            "href" => "/emails/1de4d14d-1c3e-4f33-b39a-2551af108f7e"
          }

          response
        end
      end
    end
  end
end
