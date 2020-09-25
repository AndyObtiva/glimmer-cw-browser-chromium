# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: glimmer-cw-browser-chromium 4.17.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "glimmer-cw-browser-chromium".freeze
  s.version = "4.17.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andy Maleh".freeze]
  s.date = "2020-09-25"
  s.description = "Chromium Browser - Glimmer Custom Widget".freeze
  s.email = "andy.am@gmail.com".freeze
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "CHANGELOG.md",
    "Downloadfile",
    "LICENSE.txt",
    "README.md",
    "VERSION",
    "glimmer-cw-browser-chromium.gemspec",
    "lib/glimmer-cw-browser-chromium.rb",
    "lib/glimmer-cw-browser-chromium/ext/glimmer/swt/browser_proxy.rb",
    "samples/browser-chromium/hello_browser_chromium.rb",
    "vendor/jars/linux/swt-chromium.jar",
    "vendor/jars/mac/swt-chromium.jar",
    "vendor/jars/windows/swt-chromium.jar"
  ]
  s.homepage = "http://github.com/AndyObtiva/glimmer-cw-browser-chromium".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.4".freeze
  s.summary = "Chromium Browser - Glimmer Custom Widget".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<glimmer-dsl-swt>.freeze, [">= 4.17.2.0", "< 5.0.0.0"])
    s.add_runtime_dependency(%q<bundler-download>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
    s.add_development_dependency(%q<juwelier>.freeze, ["~> 2.4.9"])
    s.add_development_dependency(%q<git-glimmer>.freeze, ["= 1.7.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  else
    s.add_dependency(%q<glimmer-dsl-swt>.freeze, [">= 4.17.2.0", "< 5.0.0.0"])
    s.add_dependency(%q<bundler-download>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
    s.add_dependency(%q<juwelier>.freeze, ["~> 2.4.9"])
    s.add_dependency(%q<git-glimmer>.freeze, ["= 1.7.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end

