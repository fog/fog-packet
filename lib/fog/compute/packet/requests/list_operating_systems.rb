module Fog
  module Compute
    class Packet
      # Real
      class Real
        def list_operating_systems
          request(
            :expects => [200],
            :method => "GET",
            :path => "/operating-systems"
          )
        end
      end

      # Mock
      class Mock
        def list_operating_systems
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "operating_systems" => [
              {
                "id" => "06e21644-a769-11e6-80f5-76304dec7eb7",
                "slug" => "alpine_3",
                "name" => "Alpine 3",
                "distro" => "alpine",
                "version" => "3",
                "provisionable_on" => [],
                "default_cidr_size" => 31
              },
              {
                "id" => "06e21978-a769-11e6-80f5-76304dec7eb7",
                "slug" => "centos_6",
                "name" => "CentOS 6",
                "distro" => "centos",
                "version" => "6",
                "provisionable_on" => [],
                "default_cidr_size" => 31
              },
              {
                "id" => "68bad60d-f5a7-45c2-ad09-573edaad3a3c",
                "slug" => "centos_7",
                "name" => "CentOS 7",
                "distro" => "centos",
                "version" => "7",
                "provisionable_on" => [
                  "c2.medium.x86",
                  "m2.xlarge.x86",
                  "baremetal_0",
                  "baremetal_1",
                  "baremetal_1e",
                  "baremetal_2",
                  "baremetal_2a",
                  "baremetal_3",
                  "baremetal_s"
                ],
                "default_cidr_size" => 31
              }
            ]
          }
          response
        end
      end
    end
  end
end
