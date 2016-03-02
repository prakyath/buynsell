# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'imagemagick/identify/version'

Gem::Specification.new do |spec|
  spec.name          = "imagemagick-identify"
  spec.version       = ImageMagick::Identify::VERSION
  spec.authors       = ["Dane Natoli"]
  spec.email         = ["dane.natoli@gmail.com"]
  spec.description   = %q{A wrapper around ImageMagick's identify command}
  spec.summary       = %q{A wrapper around ImageMagick's identify command}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
