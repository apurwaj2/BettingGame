# -*- encoding: utf-8 -*-
# stub: data_objects 0.10.17 ruby lib

Gem::Specification.new do |s|
  s.name = "data_objects".freeze
  s.version = "0.10.17"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dirkjan Bussink".freeze]
  s.date = "2016-01-24"
  s.description = "Provide a standard and simplified API for communicating with RDBMS from Ruby".freeze
  s.email = "d.bussink@gmail.com".freeze
  s.extra_rdoc_files = ["README.markdown".freeze]
  s.files = ["README.markdown".freeze]
  s.homepage = "http://github.com/datamapper/do".freeze
  s.rubygems_version = "3.1.2".freeze
  s.summary = "DataObjects basic API and shared driver specifications".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.1"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 2.5"])
    s.add_development_dependency(%q<yard>.freeze, ["~> 0.5"])
  else
    s.add_dependency(%q<addressable>.freeze, ["~> 2.1"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.5"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.5"])
  end
end
