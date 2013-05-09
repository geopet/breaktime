# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'break_time/version'

Gem::Specification.new do |spec|
  spec.name          = "break_time"
  spec.version       = BreakTime::VERSION
  spec.authors       = ["Geoff Petrie"]
  spec.email         = ["g.petrie@gmail.com"]
  spec.description   = %q{A little gem to provide a quick break.}
  spec.summary       = %q{A little gem to provide a quick break in markdown or html.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
