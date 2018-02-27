# necessary when requiring fog without rubygems while also
# maintaining ruby 1.8.7 support (can't use require_relative)
LIB_DIR = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift __LIB_DIR__ unless $LOAD_PATH.include?(LIB_DIR)

# Fog-OneAndOne Core Dependencies
require 'fog/core'
require 'fog/json'

require_relative 'packet/compute'
