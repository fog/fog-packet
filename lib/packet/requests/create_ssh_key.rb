module Fog
  module Compute
    class Packet
      # Real
      class Real
        def create_ssh_key(options)
          sshkey = {
            "label" => options[:label],
            "key" => options[:key]
          }

          request(
            :expects => [201],
            :method => "POST",
            :path => "/ssh-keys",
            :body => Fog::JSON.encode(sshkey)
          )
        end
      end

      # Mock
      class Mock
        def create_ssh_key(_options)
          response = Excon::Response.new
          response.status = 201
          response.body = {
            "id" => "7722a922-d66e-4afa-bf5e-a7aec8955016",
            "label" => "test",
            "key" => "ssh-rsa AAAAB3Nz",
            "fingerprint" => "0c:a9:79:a9:d7:29:49:5d:0e:43:41:bc:dc:4d:ac:78",
            "created_at" => "2018-03-27T10:46:33Z",
            "updated_at" => "2018-03-27T10:46:33Z",
            "owner" => {
              "href" => "/users/2dce124f-3220-495c-907e-5bbbd4dda77c"
            },
            "href" => "/ssh-keys/7722a922-d66e-4afa-bf5e-a7aec8955016"
          }

          response
        end
      end
    end
  end
end
