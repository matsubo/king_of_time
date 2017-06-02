# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'king_of_time/version'

Gem::Specification.new do |spec|
  spec.name          = "king_of_time"
  spec.version       = KingOfTime::VERSION
  spec.authors       = ["Yuki Matsukura"]
  spec.email         = ["matsubokkuri@gmail.com"]

  spec.summary       = %q{King of Time HTTP client.}
  spec.description   = %q{King of Time HTTP client.}
  spec.homepage      = "https://github.com/matsubo/king_of_time"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  unless spec.respond_to?(:metadata)
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "rest-client"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-doc"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "webmock"

end
