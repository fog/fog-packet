require_relative "device"

module Fog
  module Compute
    class Packet
      # Devices Collection
      class Devices < Fog::Compute::Packet::Servers
        model Fog::Compute::Packet::Device
      end
    end
  end
end
