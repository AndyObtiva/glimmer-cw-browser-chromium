# Chromium Browser 4.17.0.0
## [<img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=40 /> Glimmer Custom Widget](https://github.com/AndyObtiva/glimmer#custom-widget-gem)
[![Gem Version](https://badge.fury.io/rb/glimmer-cw-video.svg)](http://badge.fury.io/rb/glimmer-cw-video)
[![Join the chat at https://gitter.im/AndyObtiva/glimmer](https://badges.gitter.im/AndyObtiva/glimmer.svg)](https://gitter.im/AndyObtiva/glimmer?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Chromium Browser is a [Glimmer Custom Widget](https://github.com/AndyObtiva/glimmer#custom-widget-gem) that brings Chromium support into the [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt)

[SWT (Standard Widget Toolkit)](https://www.eclipse.org/swt/) started supporting the Chromium Browser in version 4.17 via the `SWT.CHROMIUM` SWT style.

In order for it to work however, it needs the [SWT Chromium support libraries](https://download.eclipse.org/eclipse/downloads/drops4/R-4.17-202009021800/#SWTChromium) and the [CEF](https://bitbucket.org/chromiumembedded/cef/src/master/) Binaries as outlined in the [SWT FAQ](https://www.eclipse.org/swt/faq.php#howusechromium).

The Chromium Browser [Glimmer Custom Widget](https://github.com/AndyObtiva/glimmer#custom-widget-gem) automates the inclusion of Chromium support libraries by relying on [bundler-download](https://github.com/AndyObtiva/bundler-download) gem (details under [setup](#setup))

Note: Gem version numbers are in sync with the SWT Chromium library versions. The first two numbers represent the SWT Chromium version number. The last two numbers represent the minor and patch versions of the Chromium Browser Glimmer Custom Widget.

## Content

- [SWT Chromium support libraries](https://download.eclipse.org/eclipse/downloads/drops4/R-4.17-202009021800/#SWTChromium) (v4.17-202009021800): included in gem
- [CEF](https://bitbucket.org/chromiumembedded/cef/src/master/) Binaries (v0.4.0.202005172227) via a bundler-download [Downloadfile](Downloadfile): downloaded via bundler-download Bundler plugin upon `bundle install`

## Platforms

- Mac
- Windows
- Linux

## Pre-requisites

- [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt) application, [Glimmer](https://github.com/AndyObtiva/glimmer-dsl-swt) custom shell, or another [Glimmer](https://github.com/AndyObtiva/glimmer-dsl-swt) custom widget
- [JRuby](https://github.com/AndyObtiva/glimmer-dsl-swt#pre-requisites) version required by [Glimmer](https://github.com/AndyObtiva/glimmer-dsl-swt)
- [Java](https://github.com/AndyObtiva/glimmer-dsl-swt#pre-requisites) version required by [Glimmer](https://github.com/AndyObtiva/glimmer-dsl-swt)

## Setup

The Chromium Browser gem includes downloads in a [Downloadfile](Downloadfile) and relies on the the [bundler-download](https://github.com/AndyObtiva/bundler-download) Bundler plugin to automatically download extra files.

### Glimmer Application

#### Option 1: Pre-Download Binaries via Bundler Plugin

Add the following to a Glimmer application `Gemfile`:

```ruby
plugin 'bundler-download'

gem 'glimmer-cw-browser-chromium', '~> 4.17.0.0'
```

Run this twice (the first time to install the `bundler-download` plugin and the second time to activate it and download extra files at the end):

```
jruby -S bundle
```

(or just `bundle` if using RVM)

#### Option 2: Download Binaries on First Use without Bundler Plugin

This option is useful if you want to include the Chromium Browser as a passive available option without forcing apps to download large binary files if they do not need the feature.

Add the following to a Glimmer application `Gemfile`:

```ruby
gem 'glimmer-cw-browser-chromium', '~> 4.17.0.0'
```

Run this:

```
jruby -S bundle
```

(or just `bundle` if using RVM)

The first time you use the `browser(:chromium)` widget, extra file downloads are initiated to obtain the [CEF](https://bitbucket.org/chromiumembedded/cef/src/master/) Binaries (if not downloaded already).

### Glimmer Custom Shell gem or Glimmer Custom Widget gem

Both options 1 and 2 from [Glimmer Application](#glimmer-application) instructions are available for [custom shells](https://github.com/AndyObtiva/glimmer-dsl-swt#custom-shells) and [custom widgets](https://github.com/AndyObtiva/glimmer-dsl-swt#custom-widget) too.

When reusing in a Glimmer custom shell only (not custom widget), start by installing the [bundler-download](https://github.com/AndyObtiva/bundler-download) Bundler plugin manually:

```
bundle plugin install bundler-download
```

Afterwards, for both custom shells and custom widgets, add the following line to `Gemfile` (especially if you're using [Jeweler](https://github.com/technicalpickles/jeweler)/[Juwelier](https://github.com/flajann2/juwelier)):

```ruby
gem 'glimmer-cw-browser-chromium', '~> 4.17.0.0'
```

Run this to install gem and download extra files at the end via [bundler-download](https://github.com/AndyObtiva/bundler-download):

```
jruby -S bundle
```

(or just `bundle` if using [RVM](https://rvm.io))

If not using [Jeweler](https://github.com/technicalpickles/jeweler)/[Juwelier](https://github.com/flajann2/juwelier), add the following line to the gemspec:

```ruby
s.add_runtime_dependency(%q<glimmer-cw-browser-chromium>.freeze, [">= 4.17.0.0", "< 5.0.0.0"])
```

Finally, just require the library in your code.

```ruby
require 'glimmer-cw-browser-chromium'
```

## Instructions

`browser(:chromium)` is the [Glimmer GUI DSL](https://github.com/AndyObtiva/glimmer-dsl-swt#glimmer-gui-dsl-syntax) keyword to use.

It is the same as the standard `browser` widget but with the `:chromium` [SWT style](https://github.com/AndyObtiva/glimmer-dsl-swt#widget-styles).

## Sample

### Hello, Browser Chromium!

Glimmer code (from [samples/browser-chromium/hello_browser_chromium.rb](samples/browser-chromium/hello_browser_chromium.rb)):

```ruby
require_relative '../../lib/glimmer-cw-browser-chromium'

include Glimmer

shell {
  minimum_size 1024, 860
  browser(:chromium) {
    url 'https://brightonresort.com/about'
  }
}.open
```

Run:

```
glimmer sample:run[hello_browser_chromium]
```

Glimmer app:

![Chromium Browser](https://raw.githubusercontent.com/AndyObtiva/glimmer-dsl-swt/master/images/glimmer-hello-browser.png)

## Troubleshooting

If the Chromium Browser widget does not work for whatever reason due to missing or corrupt [CEF](https://bitbucket.org/chromiumembedded/cef/src/master/) Binaries, you may clear and redownload manually via `bundle download` commands (from [bundler-download](https://github.com/AndyObtiva/bundler-download)).

To show downloaded files, run:

```
bundle download show
```

This should print something like:

```
Showing downloaded files for /Users/User/.rvm/gems/jruby-9.2.13.0@glimmer-cw-video/gems/glimmer-cw-browser-chromium-4.17.0.0/Downloadfile
54070695 /Users/User/.rvm/gems/jruby-9.2.13.0@glimmer-cw-video/gems/glimmer-cw-browser-chromium-4.17.0.0/vendor/jars/mac/com.make.chromium.cef.cocoa.macosx.x86_64_0.4.0.202005172227.jar
```

To clear downloads, run:

```
bundle download clear
```

To redownload, run:

```
bundle download
```

## Contributing to glimmer-cw-browser-chromium
 
- Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
- Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
- Fork the project.
- Start a feature/bugfix branch.
- Commit and push until you are happy with your contribution.
- Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
- Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## License

[MIT](LICENSE.txt)

Copyright (c) 2020 - Andy Maleh.

--

[<img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=40 />](https://github.com/AndyObtiva/glimmer) Built for [Glimmer](https://github.com/AndyObtiva/glimmer) (Ruby Desktop Development GUI Library).
