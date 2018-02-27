require 'fog/core'
require 'fog/json'

module Fog
  # Packet module
  module Packet
    extend Fog::Provider
    service(:compute, 'Compute')
  end
end
