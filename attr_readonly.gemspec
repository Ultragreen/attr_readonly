# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'attr_readonly/version'

Gem::Specification.new do |spec|
  spec.name          = "attr_readonly"
  spec.version       = AttrReadonly::VERSION
  spec.authors       = ["Romain GEORGES"]
  spec.email         = ["romain@ultragreen.net"]
  spec.description   = %q{Provide a new macro like attr_accessor to make real read_only accessors to frozen dup of the attributs given in parameters}
  spec.summary       = %q{Provide a new macro like attr_accessor to make real read_only accessors}
  spec.homepage      = ""
  spec.license       = "BSD"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('yard')
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('roodi')
  spec.add_development_dependency('code_statistics')
  spec.add_development_dependency('yard-rspec')
  spec.add_development_dependency('github_markup')
  spec.add_development_dependency('redcarpet')
end
