# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'r2pipe/version'

Gem::Specification.new do |spec|
  spec.name          = "r2pipe"
  spec.version       = R2pipe::VERSION
  spec.authors       = ["Jeffrey Crowell", "pancake"]
  spec.email         = ["crowell@bu.edu", "pancake@nopcode.org"]

  spec.summary       = %q{Communicate with Radare2 via pipes.}
  spec.description   = %q{R2Pipe implementation in ruby.}
  spec.homepage      = "https://github.com/crowell/r2pipe-ruby"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.license       = "LGPL"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
