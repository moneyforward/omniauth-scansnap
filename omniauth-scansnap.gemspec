lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/scansnap/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-scansnap"
  spec.version       = Omniauth::Scansnap::VERSION
  spec.authors       = ["tyamagu2"]
  spec.email         = ["tyamagu2@gmail.com"]

  spec.summary       = %q{OmniAuth OAuth2 Strategy for ScanSnap}
  spec.homepage      = "https://github.com/moneyforward/omniauth-scansnap"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth"
  spec.add_dependency "omniauth-oauth2"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
