lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'password_strength_validator/version'

Gem::Specification.new do |spec|
  spec.name          = 'password_strength_validator'
  spec.version       = PasswordStrengthValidator::VERSION
  spec.authors       = ['SHIOYA, Hiromu']
  spec.email         = ['kwappa.856@gmail.com']

  spec.summary       = 'validates strength of password with ActiveRecord'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/kwappa/password_strength_validator'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency "activemodel"

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
end
