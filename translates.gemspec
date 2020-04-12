
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "translates/version"

Gem::Specification.new do |spec|
  spec.name          = "translates"
  spec.version       = Translates::VERSION
  spec.authors       = ["Chris Salzberg"]
  spec.email         = ["csalzberg@degica.com"]

  spec.summary       = %q{Minimal implementation of backend/plugin-based translation framework.}
  spec.homepage      = "https://github.com/shioyama/translates"
  spec.license       = "MIT"

  spec.files        = Dir['{lib/**/*,[A-Z]*}']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'i18n', '>= 0.6.10', '< 2'
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
