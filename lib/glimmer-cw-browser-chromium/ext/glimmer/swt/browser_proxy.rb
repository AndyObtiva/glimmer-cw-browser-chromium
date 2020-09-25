# Copyright (c) 2007-2020 Andy Maleh
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'glimmer/swt/widget_proxy'
require 'glimmer/swt/swt_proxy'

module Glimmer
  module SWT
    class BrowserProxy < Glimmer::SWT::WidgetProxy    
      def initialize(*init_args, swt_widget: nil)
        underscored_widget_name, parent, args = init_args
        styles, extra_options = extract_args(underscored_widget_name, args)
        if styles.include?(:chromium) || styles.include?(SWTProxy[:chromium])
          require_jars
        end
        super
      end
      
      def require_jars
        require 'glimmer/launcher'          
        jars = Dir.glob(File.expand_path("../../../../../../vendor/jars/#{Glimmer::Launcher.platform_os}/**/*.jar", __FILE__)).to_a
        if jars.size < 2
          puts 'Please be patient while downloading files for Chromium Browser support.'
          require 'bundler-download'
          Bundler::Download.new.exec('download', [])
        end
        jars.each {|f| require f}      
      end
    end
  end
end
