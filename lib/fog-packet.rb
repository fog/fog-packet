# necessary when requiring fog without rubygems while also
# maintaining ruby 1.8.7 support (can't use require_relative)
__LIB_DIR__ = __dir__
$LOAD_PATH.unshift __LIB_DIR__ unless $LOAD_PATH.include?(__LIB_DIR__)

# Fog-OneAndOne Core Dependencies
require "fog/core"
require "fog/json"

require_relative "packet/compute"

module Fog
  # Compute
  module Compute
    autoload :Packet, File.expand_path("../packet/compute", __FILE__)
  end

  # Models
  module Models
  end

  # Packet
  module Packet
    extend Fog::Provider

    service(:compute, "Compute")
  end
end
