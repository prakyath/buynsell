# -*- encoding: utf-8 -*-
# stub: easy_zoom_on_rails 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "easy_zoom_on_rails"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Said Kaldybaev"]
  s.date = "2014-10-17"
  s.description = "Matt Hinchliffe's jQuery easy zoom plugin for rails"
  s.email = ["said.kaldybaev@gmail.com"]
  s.homepage = "https://github.com/Saidbek/easy_zoom_on_rails"
  s.rubygems_version = "2.2.2"
  s.summary = "Matt Hinchliffe's jQuery easy zoom plugin for rails"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.7"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.7"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.7"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
  end
end
