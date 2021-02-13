# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'glimmer/launcher'
require 'rake'

require 'juwelier'
Juwelier::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "glimmer-cw-browser-chromium"
  gem.homepage = "http://github.com/AndyObtiva/glimmer-cw-browser-chromium"
  gem.license = "MIT"
  gem.summary = %Q{Chromium Browser - Glimmer Custom Widget}
  gem.description = %Q{Chromium Browser - Glimmer Custom Widget - Enables using the `browser` widget with the `:chromium` SWT style (e.g. `browser(:chromium)`), embedding the Chromium web browser engine instead of the default one.}
  gem.email = "andy.am@gmail.com"
  gem.authors = ["Andy Maleh"]
  gem.files = Dir['CHANGELOG.md', 'VERSION', 'LICENSE.txt', 'README.md', 'glimmer-cw-browser-chromium.gemspec', 'Downloadfile', 'lib/**/*', 'samples/**/*', 'vendor/**/*']
  gem.post_install_message = "The glimmer-cw-browser-chromium gem includes a Downloadfile for extra binary downloads via the `bundler-download` plugin gem. \nMake sure to install the `bundler-download` plugin gem and run `bundle` again or `bundle download` in order to fetch the extra files needed for this gem to operate successfully."
  # dependencies defined in Gemfile
end
Juwelier::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
  spec.ruby_opts = [Glimmer::Launcher.jruby_os_specific_options]
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['spec'].execute
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "glimmer-cw-browser-chromium #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'glimmer/rake_task'
