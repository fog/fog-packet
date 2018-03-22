module Fog
  module Compute
    class Packet
      # Plan
      class OperatingSystem < Fog::Model
        identity :id

        attribute :slug
        attribute :name
        attribute :distro
        attribute :version
        attribute :provisionable_on
        attribute :default_cidr_size

        attr_accessor :options

        def initialize(attributes = {})
          super
        end
      end
    end
  end
end
