module Fog
  module Compute
    class Packet < Fog::Service
      API_VERSION = 'v4'.freeze

      autoload :Base, File.expand_path('../models/base', __FILE__)

      requires    :packet_token
      recognizes  :packet_url

      # Models 
      model_path 'fog/packet/models/compute'

      model :project
      collection :projects

      class Mock
        def self.data

            @data ||= Hash.new do |hash, key|
                hash[key]={
                    :plans => {
                        { 
                            plans: [
                                {
                                    id: 'e69c0169-4726-46ea-98f1-939c9e8a3607', 
                                    slug: 'baremetal_0', 
                                    name: 'Type 0', 
                                    description: 'Our Type 0 configuration is a general use "cloud killer" server, with a Intel Atom 2.4Ghz processor and 8GB of RAM.', 
                                    line: 'baremetal', 
                                    specs: {
                                        cpus: [
                                            {
                                                count: 1,
                                                type: 'Intel Atom C2550 @ 2.4Ghz'
                                            }
                                        ],
                                        memory: {
                                            total: '8GB'
                                        },
                                        drives: [
                                            {
                                                count: 1,
                                                size: '80GB', 
                                                type: 'SSD'
                                            }
                                        ],
                                        nics: [
                                            {
                                                count: 2,
                                                type: '1Gbps'
                                            }
                                        ],
                                        features: {
                                            raid: false,
                                            txt: true
                                        }
                                    },
                                    available_in: [
                                        {
                                            href: '/facilities/8e6470b3-b75e-47d1-bb93-45b225750975'
                                        },
                                        {
                                            href: '/facilities/8ea03255-89f9-4e62-9d3f-8817db82ceed'
                                        },
                                        {
                                            href: '/facilities/e1e9c52e-a0bc-4117-b996-0fc94843ea09'
                                        },
                                        {
                                            href: '/facilities/2b70eb8f-fa18-47c0-aba7-222a842362fd'
                                        }
                                    ],
                                    pricing: {
                                        hour: 0.07
                                    }
                                },
                                {
                                    id: '6d1f1ffa-7912-4b78-b50d-88cc7c8ab40f', 
                                    slug: 'baremetal_1', 
                                    name: 'Type 1', 
                                    description: 'Our Type 1 configuration is a zippy general use server, with an Intel E3-1240 v3 processor and 32GB of RAM.', 
                                    line: 'baremetal', 
                                    specs: {
                                        cpus: [
                                            {
                                                count: 1,
                                                type: 'Intel E3-1240 v3'
                                            }
                                        ],
                                        memory: {
                                            total: '32GB'
                                        },
                                        drives: [
                                            {
                                                count: 2,
                                                size: '120GB', 
                                                type: 'SSD'
                                            }
                                        ],
                                        nics: [
                                            {
                                                count: 2,
                                                type: '1Gbps'
                                            }
                                        ],
                                        features: {
                                            raid: true,
                                            txt: true
                                        }
                                    },
                                    available_in: [
                                        {
                                            href: '/facilities/8e6470b3-b75e-47d1-bb93-45b225750975'
                                        },
                                        {
                                            href: '/facilities/8ea03255-89f9-4e62-9d3f-8817db82ceed'
                                        },
                                        {
                                            href: '/facilities/e1e9c52e-a0bc-4117-b996-0fc94843ea09'
                                        },
                                        {
                                            href: '/facilities/2b70eb8f-fa18-47c0-aba7-222a842362fd'
                                        }
                                    ],
                                    pricing: {
                                        hour: 0.4
                                    }
                                },
                                {
                                    id: 'e829e15f-bfa0-4d8f-806e-cc92bb6567b4', 
                                    slug: 'baremetal_1e', 
                                    name: 'Type 1E', 
                                    description: 'Our Type 1e ...', 
                                    line: 'baremetal', 
                                    specs: {
                                        cpus: [
                                            {
                                                count: 1,
                                                type: 'Intel Xeon E3-1578L v5'
                                            }
                                        ],
                                        memory: {
                                            total: '32GB'
                                        },
                                        drives: [
                                            {
                                                count: 1,
                                                size: '240GB', 
                                                type: 'SSD'
                                            }
                                        ],
                                        nics: [
                                            {
                                                count: 2,
                                                type: '10Gbps'
                                            }
                                        ],
                                        features: {}
                                    },
                                    available_in: [
                                        {
                                            href: '/facilities/d0c0d80d-4637-4fa0-b79e-803fc42b19bd'
                                        },
                                        {
                                            href: '/facilities/fd8c403f-c81d-4de7-ba5e-91362fc2d71c'
                                        },
                                        {
                                            href: '/facilities/14a4cad8-6f81-41b6-8cba-aaf8322910af'
                                        },
                                        {
                                            href: '/facilities/75b74ee6-d7af-4a65-82ca-73c895cd50a9'
                                        },
                                        {
                                            href: '/facilities/855e3cd5-d27c-4330-9b9f-1ffd7e9bfff5'
                                        },
                                        {
                                            href: '/facilities/ad136386-a3b5-4127-b5a4-1c6ff0cc5ddb'
                                        },
                                        {
                                            href: '/facilities/8dd1568c-45be-40c0-998c-b47e7cbe3912'
                                        },
                                        {
                                            href: '/facilities/92d199e7-3203-4df1-afb5-f16a890150ac'
                                        },
                                        {
                                            href: '/facilities/8f3eb9dc-cd96-486d-9326-3c11b22a18ac'
                                        },
                                        {
                                            href: '/facilities/fe4d0bcc-ffb4-488b-9a62-9a983ed0d66d'
                                        },
                                        {
                                            href: '/facilities/ca3bb830-4aa2-4226-9daa-8d67be3c0c61'
                                        },
                                        {
                                            href: '/facilities/c4501630-3713-4751-8ea8-65d9ed8ae18f'
                                        }
                                    ],
                                    pricing: {
                                        hour: 0.4
                                    }
                                }
                            ]
                        }
                    }
                }
            end
        end

      end
    end
  end
end
