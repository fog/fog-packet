module Fog
  module Compute
    class Packet
      # Capacity Model
      class Capacity < Fog::Model
        attribute :ams1
        attribute :atl1
        attribute :dfw1
        attribute :ewr1
        attribute :fra1
        attribute :hkg1
        attribute :iad1
        attribute :lax1
        attribute :nrt1
        attribute :ord1
        attribute :sea1
        attribute :sin1
        attribute :sjc1
        attribute :hkg1
        attribute :syd1
        attribute :yyz1

        def initialize(attributes = {})
          super
        end
      end
    end
  end
end
