module Fog
  module Compute
    class Packet
      # Real
      class Real
        def list_spotmarketprices
          request(
            :expects => [200],
            :method => "GET",
            :path => "/market/spot/prices"
          )
        end
      end

      # Mock
      class Mock
        def list_spotmarketprices
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "spot_market_prices" => {
              "ams1" => {
                "baremetal_0" => {
                  "price" => 0.07
                },
                "baremetal_1" => {
                  "price" => 4.01
                },
                "baremetal_2" => {
                  "price" => 0.34
                },
                "baremetal_2a" => {
                  "price" => 0.12
                },
                "baremetal_2a2" => {
                  "price" => 5.01
                },
                "baremetal_3" => {
                  "price" => 0.35
                }
              },
              "atl1" => {
                "baremetal_1e" => {
                  "price" => 0.08
                }
              },
              "dfw1" => {
                "baremetal_1e" => {
                  "price" => 0.08
                }
              }, "ewr1" => {
                "baremetal_0" => {
                  "price" => 0.01
                },
                "baremetal_1" => {
                  "price" => 0.4
                },
                "baremetal_2" => {
                  "price" => 0.34
                },
                "baremetal_2a" => {
                  "price" => 0.2
                },
                "baremetal_2a2" => {
                  "price" => 0.1
                },
                "baremetal_3" => {
                  "price" => 0.35
                },
                "baremetal_s" => {
                  "price" => 0.3
                },
                "c2.medium.x86" => {
                  "price" => 0.2
                },
                "m2.xlarge.x86" => {
                  "price" => 20.01
                }
              },
              "fra1" => {
                "baremetal_1e" => {
                  "price" => 4.01
                }
              },
              "hkg1" => {
                "baremetal_1e" => { "price" => 0.08 }
              },
              "iad1" => {
                "baremetal_1e" => {
                  "price" => 0.08
                }
              },
              "lax1" => {
                "baremetal_1e" => {
                  "price" => 0.08
                }
              }, "nrt1" => {
                "baremetal_0" => {
                  "price" => 0.07
                },
                "baremetal_1" => {
                  "price" => 0.08
                },
                "baremetal_2" => {
                  "price" => 0.34
                },
                "baremetal_2a" => {
                  "price" => 0.1
                },
                "baremetal_2a2" => {
                  "price" => 5.01
                }
              },
              "ord1" => {
                "baremetal_1e" => {
                  "price" => 0.08
                }
              },
              "sea1" => {
                "baremetal_1e" => {
                  "price" => 0.09
                }
              },
              "sin1" => {
                "baremetal_1e" => {
                  "price" => 0.08
                }
              },
              "sjc1" => {
                "baremetal_0" => {
                  "price" => 0.07
                },
                "baremetal_1" => {
                  "price" => 0.15
                },
                "baremetal_2" => {
                  "price" => 0.34
                },
                "baremetal_2a" => {
                  "price" => 0.1
                },
                "baremetal_2a2" => {
                  "price" => 5.01
                },
                "baremetal_3" => {
                  "price" => 0.35
                },
                "c2.medium.x86" => {
                  "price" => 0.2
                },
                "m2.xlarge.x86" => {
                  "price" => 0.4
                }
              },
              "syd1" => {
                "baremetal_1e" => {
                  "price" => 0.08
                }
              },
              "yyz1" => {
                "baremetal_1e" => {
                  "price" => 0.08
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
