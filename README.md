# UserAgent

[![Build Status](https://travis-ci.org/gshutler/useragent.svg?branch=master)](https://travis-ci.org/gshutler/useragent)
[![Gem Version](https://badge.fury.io/rb/useragent.svg)](http://badge.fury.io/rb/useragent)

UserAgent is a Ruby library that parses and compares HTTP User Agents.

## Installation

    gem install useragent

### Examples

#### Reporting

```ruby
string = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.56 Safari/536.5'
user_agent = UserAgent.parse(string)
user_agent.browser
# => 'Chrome'
user_agent.version
# => '19.0.1084.56'
user_agent.platform
# => 'Macintosh'
```

#### Comparison

```ruby
Browser = Struct.new(:browser, :version)

SupportedBrowsers = [
  Browser.new("Safari", "3.1.1"),
  Browser.new("Firefox", "2.0.0.14"),
  Browser.new("Internet Explorer", "7.0")
]

user_agent = UserAgent.parse(request.user_agent)
SupportedBrowsers.detect { |browser| user_agent >= browser }
```

## Building and Publishing @ ART19

This gem is deployed to GitHub packages. Follow the [GitHub Packages Guide](https://help.github.com/en/github/managing-packages-with-github-packages/configuring-rubygems-for-use-with-github-packages) to set up your system for this. You will end up creating a key in `~/.gem/credentials`, probably named `github`. Once you've done that, you can `GEM_PUSH_KEY=whatever bundle exec rake publish` to publish the gem. Please note that once you "use" a version number on GitHub, it's used forever, so be sure to edit the version number in the app to add `.pre.GIT_SHORT_HASH` to the end if this is a test build (you can use `git rev-parse --short --verify HEAD` to get the Git short hash).

Copyright (c) 2015-2019 Garry Shutler, released under the MIT license
Copyright (c) 2020 ART19 Inc., released under the MIT license
