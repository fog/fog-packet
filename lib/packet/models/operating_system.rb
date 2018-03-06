module Fog
  module Compute
    class Packet
      class OperatingSystem < Fog::Model
        identity :id
        attribute :name
        attribute :slug
        attribute :distro
        attribute :version
        attribute :provisionable_on
        attribute :default_cidr_size

        def initialize(attributes = {})
          super
        end
      end
    end
  end
end
