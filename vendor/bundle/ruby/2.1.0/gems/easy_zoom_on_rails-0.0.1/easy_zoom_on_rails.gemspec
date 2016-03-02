# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easy_zoom_on_rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'easy_zoom_on_rails'
  spec.version       = EasyZoomOnRails::VERSION
  spec.authors       = ['Said Kaldybaev']
  spec.email         = ['said.kaldybaev@gmail.com']
  spec.summary       = %q{Matt Hinchliffe's jQuery easy zoom plugin for rails}
  spec.description   = %q{Matt Hinchliffe's jQuery easy zoom plugin for rails}
  spec.homepage      = 'https://github.com/Saidbek/easy_zoom_on_rails'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
