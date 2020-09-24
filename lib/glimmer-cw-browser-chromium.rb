$LOAD_PATH.unshift(File.expand_path('..', __FILE__))

require 'glimmer-dsl-swt'
require 'glimmer/launcher'

jars = Dir.glob(File.expand_path("../../vendor/jars/#{Glimmer::Launcher.platform_os}/**/*.jar", __FILE__)).to_a
if jars.size < 2
  puts 'Please be patient while downloading files for Chromium Browser support.'
  require 'bundler-download'
  Bundler::Download.new.exec('download', [])
end
jars.each {|f| require f}
