lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fog-packet"
  spec.version       = "1.1.0"
  spec.authors       = ["Jasmin Gacic"]
  spec.email         = "jasmin@stackpointcloud.com"
  spec.summary       = "Module for the 'fog' gem to support Packet."
  spec.description   = "This library can be used as a module for 'fog' or as
                        a standalone Packet provider."
  spec.homepage      = "https://github.com/fog/fog-packet"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "fog-core"
  spec.add_runtime_dependency "fog-json"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "rubocop" if RUBY_VERSION >= "2.0.0"

end
