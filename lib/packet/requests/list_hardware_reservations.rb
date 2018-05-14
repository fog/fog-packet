module Fog
  module Compute
    class Packet
      # Real
      class Real
        def list_hardware_reservations(project_id, params = {})
          request(
            :expects => [200],
            :method => "GET",
            :path => "/projects/" + project_id + "/hardware-reservations",
            :params => params
          )
        end
      end

      # Mock
      class Mock
        def list_hardware_reservations(_project_id, _params = {})
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "hardware_reservations" => [
              {
                "id" => "string",
                "short_id" => "string",
                "facility" => {
                  "id" => "string",
                  "name" => "string",
                  "code" => "string",
                  "features" => [
                    "string"
                  ],
                  "address" => {
                    "$ref" => "#\/definitions\/Address"
                  }
                },
                "plan" => {
                  "id" => "string",
                  "slug" => "string",
                  "name" => "string",
                  "description" => "string",
                  "line" => "string",
                  "specs" => "object",
                  "pricing" => "object",
                  "legacy" => "boolean",
                  "class" => "string",
                  "available_in" => [
                    {
                      "href" => "string"
                    }
                  ]
                },
                "href" => "string",
                "project" => {
                  "id" => "string",
                  "name" => "string",
                  "created_at" => "string",
                  "updated_at" => "string",
                  "max_devices" => "object",
                  "members" => [
                    {
                      "href" => "string"
                    }
                  ],
                  "memberships" => [
                    {
                      "href" => "string"
                    }
                  ],
                  "network_status" => "object",
                  "invitations" => [
                    {
                      "href" => "string"
                    }
                  ],
                  "payment_method" => {
                    "$ref" => "#\/definitions\/Href"
                  },
                  "devices" => [
                    {
                      "href" => "string"
                    }
                  ],
                  "ssh_keys" => [
                    {
                      "href" => "string"
                    }
                  ],
                  "volumes" => [
                    {
                      "href" => "string"
                    }
                  ],
                  "bgp_config" => {
                    "$ref" => "#\/definitions\/Href"
                  },
                  "customdata" => "string"
                },
                "device" => {
                  "id" => "string",
                  "short_id" => "string",
                  "hostname" => "string",
                  "description" => "string",
                  "state" => "string",
                  "tags" => [
                    "string"
                  ],
                  "image_url" => "string",
                  "billing_cycle" => "string",
                  "user" => "string",
                  "iqn" => "string",
                  "locked" => "boolean",
                  "bonding_mode" => "integer",
                  "created_at" => "string",
                  "updated_at" => "string",
                  "spot_instance" => "boolean",
                  "spot_price_max" => "number",
                  "termination_time" => "string",
                  "customdata" => "string",
                  "provisioning_percentage" => "number",
                  "operating_system" => {
                    "$ref" => "#\/definitions\/OperatingSystem"
                  },
                  "always_pxe" => "boolean",
                  "ipxe_script_url" => "string",
                  "location" => {
                    "$ref" => "#\/definitions\/HardwareLocation"
                  },
                  "facility" => {
                    "$ref" => "#\/definitions\/Facility"
                  },
                  "plan" => {
                    "$ref" => "#\/definitions\/Plan"
                  },
                  "userdata" => "string",
                  "root_password" => "string",
                  "href" => "string",
                  "project" => {
                    "$ref" => "#\/definitions\/Href",
                    "description" => "Full version of project object when included"
                  },
                  "project_lite" => {
                    "$ref" => "#\/definitions\/Href",
                    "description" => "Lite version of project object when included"
                  },
                  "volumes" => [
                    {
                      "href" => "string"
                    }
                  ],
                  "hardware_reservation" => {
                    "$ref" => "#\/definitions\/Href"
                  },
                  "ssh_keys" => [
                    {
                      "href" => "string"
                    }
                  ],
                  "ip_addresses" => [
                    {
                      "id" => "string",
                      "address_family" => "integer",
                      "netmask" => "string",
                      "public" => "boolean",
                      "enabled" => "boolean",
                      "cidr" => "integer",
                      "management" => "boolean",
                      "manageable" => "boolean",
                      "network" => "string",
                      "address" => "string",
                      "gateway" => "string",
                      "href" => "string",
                      "created_at" => "string"
                    }
                  ],
                  "provisioning_events" => [
                    {
                      "id" => "string",
                      "state" => "string",
                      "type" => "string",
                      "body" => "string",
                      "relationships" => "array",
                      "interpolated" => "string",
                      "created_at" => "string",
                      "href" => "string"
                    }
                  ]
                },
                "created_at" => "string"
              }
            ],
            "meta" => {
              "first" => {
                "href" => "string"
              },
              "previous" => {
                "href" => "string"
              },
              "self" => {
                "href" => "string"
              },
              "next" => {
                "href" => "string"
              },
              "last" => {
                "href" => "string"
              },
              "total" => "integer"
            }
          }
          response
        end
      end
    end
  end
end
