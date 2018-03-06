module Fog
  module Compute
    class Packet
      class Real
        def list_project_devices(project_id)
          request(
            expects: [200],
            method: 'GET',
            path: '/projects/' + project_id + '/devices'
          )
        end
      end

      class Mock

        def list_project_devices
          response = Excon::Response.new
          response.status = 200
          response.body = {"projects" => [{"id" => "93125c2a-8b78-4d4f-a3c4-7367d6b7cca8", "name" => "spc-fran-test", "created_at" => "2018-02-28T20:29:17Z", "updated_at" => "2018-03-05T11:48:15Z", "network_status" => {}, "max_devices" => {"baremetal_0" => 9999, "baremetal_1" => 9999, "baremetal_2" => 9999, "baremetal_3" => 9999, "baremetal_2a" => 9999, "baremetal_hua" => 9999, "baremetal_s" => 9999, "baremetal_2a2" => 9999, "baremetal_1e" => 9999, "baremetal_2a5" => 9999, "baremetal_2a4" => 9999, "m2.xlarge.x86" => 9999, "c2.medium.x86" => 9999, "storage_1" => nil, "storage_2" => nil}, "organization" => {"href" => "/organizations/6c17df6c-8769-4d98-b01f-f2848b6489a1"}, "members" => [{"href" => "/users/1140617d-262d-4502-a3d6-771d83c930da"}, {"href" => "/users/2dce124f-3220-495c-907e-5bbbd4dda77c"}, {"href" => "/users/8f23cd1f-09e0-4539-9524-6387e4f8d44d"}, {"href" => "/users/9532399b-4461-4c78-bbd9-d6250e2dc723"}], "memberships" => [], "invitations" => [], "devices" => [], "ssh_keys" => [{"href" => "/ssh-keys/c2d63645-6051-4d19-92ab-0af335d3a1d5"}], "transfers" => [], "volumes" => [], "href" => "/projects/93125c2a-8b78-4d4f-a3c4-7367d6b7cca8"}], "meta" => {"first" => {"href" => "/projects?page=1"}, "previous" => nil, "self" => {"href" => "/projects?page=1"}, "next" => nil, "last" => {"href" => "/projects?page=1"}, "current_page" => 1, "last_page" => 1, "total" => 1}}
          response
        end

      end
    end
  end
end
