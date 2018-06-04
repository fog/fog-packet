module Fog
  module Compute
    class Packet
      # Real
      class Real
        def get_capacity
          request(
            :expects => [200],
            :method => "GET",
            :path => "/capacity"
          )
        end
      end

      # Mock
      class Mock
        def get_capacity
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "capacity" => {
              "ams1" => {
                "baremetal_2a" => {
                  "level" => "unavailable"
                },
                "baremetal_2a2" => {
                  "level" => "unavailable"
                },
                "baremetal_1" => {
                  "level" => "unavailable"
                },
                "baremetal_3" => {
                  "level" => "limited"
                },
                "baremetal_2" => {
                  "level" => "limited"
                },
                "baremetal_0" => {
                  "level" => "normal"
                }
              },
              "atl1" => {
                "baremetal_1e" => {
                  "level" => "normal"
                }
              },
              "dfw1" => {
                "baremetal_1e" => {
                  "level" => "limited"
                }
              },
              "ewr1" => {
                "baremetal_2a" => {
                  "level" => "limited"
                },
                "baremetal_2a2" => {
                  "level" => "limited"
                },
                "baremetal_1" => {
                  "level" => "normal"
                },
                "baremetal_3" => {
                  "level" => "limited"
                },
                "baremetal_2" => {
                  "level" => "limited"
                },
                "baremetal_s" => {
                  "level" => "normal"
                },
                "baremetal_0" => {
                  "level" => "normal"
                }
              },
              "fra1" => {
                "baremetal_1e" => {
                  "level" => "limited"
                }
              },
              "hkg1" => {
                "baremetal_1e" => {
                  "level" => "normal"
                }
              },
              "iad1" => {
                "baremetal_1e" => {
                  "level" => "limited"
                }
              },
              "lax1" => {
                "baremetal_1e" => {
                  "level" => "limited"
                }
              },
              "nrt1" => {
                "baremetal_2a" => {
                  "level" => "limited"
                },
                "baremetal_2a2" => {
                  "level" => "unavailable"
                },
                "baremetal_1" => {
                  "level" => "limited"
                },
                "baremetal_2" => {
                  "level" => "limited"
                },
                "baremetal_0" => {
                  "level" => "normal"
                }
              },
              "ord1" => {
                "baremetal_1e" => {
                  "level" => "normal"
                }
              },
              "sea1" => {
                "baremetal_1e" => {
                  "level" => "normal"
                }
              },
              "sin1" => {
                "baremetal_1e" => {
                  "level" => "limited"
                }
              },
              "sjc1" => {
                "baremetal_2a" => {
                  "level" => "limited"
                },
                "baremetal_2a2" => {
                  "level" => "unavailable"
                },
                "baremetal_1" => {
                  "level" => "normal"
                },
                "baremetal_3" => {
                  "level" => "limited"
                },
                "baremetal_2" => {
                  "level" => "limited"
                },
                "baremetal_0" => {
                  "level" => "normal"
                }
              },
              "syd1" => {
                "baremetal_1e" => {
                  "level" => "limited"
                }
              },
              "yyz1" => {
                "baremetal_1e" => {
                  "level" => "limited"
                }
              }
            }
          }

          response
        end
      end
    end
  end
end
