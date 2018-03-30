module Fog
  module Compute
    class Packet
      # Real
      class Real
        def get_ssh_key(id)
          request(
            :expects => [200],
            :method => "GET",
            :path => "/ssh-keys/" + id
          )
        end
      end

      # Mock
      class Mock
        def get_ssh_key(id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "id" => id,
            "label" => "test_jg",
            "key" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDgnV5MOhBqpQLt66KGlMKi",
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
