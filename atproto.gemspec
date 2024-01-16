Gem::Specification.new do |spec|
  spec.name          = "atproto"
  spec.version       = "0.0.1"
  spec.authors       = ["Teal Bauer"]
  spec.email         = ["atproto-ruby@x.moeffju.net"]

  spec.summary       = %q{ATProto Client Library}
  spec.description   = %q{A simple Ruby client library for the ATProto API.}
  spec.homepage      = "https://github.com/moeffju/atproto"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_dependency "jwt", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
end
