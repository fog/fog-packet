module Fog
  module Compute
    class Packet
      class Facility < Fog::Model
        identity :id
        attribute :name
        attribute :code
        attribute :features
        attribute :address
        attribute :ip_ranges

        attr_accessor :options

        def initialize(attributes = {})
          super
        end
      end
    end
  end
end
