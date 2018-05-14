module Fog
  module Compute
    class Packet
      # Real
      class Real
        def list_projects(params = {})
          request(
            :expects => [200],
            :method => "GET",
            :path => "/projects",
            :params => params
          )
        end
      end

      # Mock
      class Mock
        def list_projects(_params = {})
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "projects" => [
              {
                "id" => "1140617d-262d-4502-a3d6-771d83c930da",
                "name" => "spc-fran-test",
                "created_at" => "2018-02-28T20:29:17Z",
                "updated_at" => "2018-03-06T11:19:30Z",
                "network_status" => {
                  "sjc1" => "provisioned"
                },
                "max_devices" => {
                  "baremetal_0" => 9999,
                  "baremetal_1" => 9999
                },
                "organization" => {
                  "href" => "/organizations/6c17df6c-8769-4d98-b01f-f2848b6489a1"
                },
                "members" => [
                  {
                    "href" => "/users/1140617d-262d-4502-a3d6-771d83c930da"
                  },
                  {
                    "href" => "/users/2dce124f-3220-495c-907e-5bbbd4dda77c"
                  },
                  {
                    "href" => "/users/8f23cd1f-09e0-4539-9524-6387e4f8d44d"
                  },
                  {
                    "href" => "/users/9532399b-4461-4c78-bbd9-d6250e2dc723"
                  }
                ],
                "memberships" => [],
                "invitations" => [],
                "devices" => [],
                "ssh_keys" => [
                  {
                    "href" => "/ssh-keys/c2d63645-6051-4d19-92ab-0af335d3a1d5"
                  }
                ],
                "transfers" => [],
                "volumes" => [],
                "href" => "/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"
              }
            ],
            "meta" => {
              "first" => {
                "href" => "/projects?page=1"
              },
              "previous" => nil,
              "self" => {
                "href" => "/projects?page=1"
              },
              "next" => nil,
              "last" => {
                "href" => "/projects?page=1"
              },
              "current_page" => 1,
              "last_page" => 1,
              "total" => 1
            }
          }
          response
        end
      end
    end
  end
end
