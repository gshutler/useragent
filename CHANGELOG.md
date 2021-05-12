# 1.1.0

* Add browsers support with Acast, Airr, Alexa (Speaker & App), Amazon Music, Apple HomePod, Sonos, Castbox, iHeartRadio
* Add `speaker?` and `desktop?`, and update existing browsers to support that
* Improve Apple Podcasts
* Rename GoogleAssistant to GooglePodcasts and Improve it

# 1.0.1

* [#22](https://github.com/art19/useragent/pull/22) Add support for Edge on non-Windows OS (thanks @hollandmatt)

# 1.0.0

Due to inactivity on upstream we decided to treat this as a real, independent fork. The following changes are added to this version

* [#21](https://github.com/art19/useragent/pull/21) Improved support for watchOS
  * Replace former implementation of Apple Watch browers with new AirTraffic.framework and Pod2Watch
  * Add support for AirTraffic.framework on Apple Watch
  * Add support for Pod2Watch on Apple Watch
  * AppleCoreMedia now detects the Apple Watch operating system
  * Converted this gem to work as a real fork and bumped the version to 1.0.0
* [#20](https://github.com/art19/useragent/pull/20) Gecko android platform
* [#19](https://github.com/art19/useragent/pull/19) Add support for 'Edge Anaheim'
* [#18](https://github.com/art19/useragent/pull/18) Upgrade to Ruby 2.7
