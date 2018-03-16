module Fog
  module Compute
    class Packet
      class Plan < Fog::Model
        identity :id

        attribute :slug
        attribute :name
        attribute :description
        attribute :line
        attribute :specs
        attribute :pricing

        attr_accessor :options

        def initialize(attributes = {})
          super
        end
      end
    end
  end
end
