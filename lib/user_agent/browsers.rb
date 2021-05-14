# frozen_string_literal: true

require 'user_agent/browsers/base'
require 'user_agent/browsers/webkit'

require 'user_agent/browsers/acast'
require 'user_agent/browsers/airr'
require 'user_agent/browsers/alexa'
require 'user_agent/browsers/amazon_music'
require 'user_agent/browsers/apple_core_media'
require 'user_agent/browsers/apple_homepod'
require 'user_agent/browsers/apple_podcasts'
require 'user_agent/browsers/apple_watch/base'
require 'user_agent/browsers/apple_watch/atc'
require 'user_agent/browsers/apple_watch/pod_2_watch'
require 'user_agent/browsers/castbox'
require 'user_agent/browsers/chrome'
require 'user_agent/browsers/edge'
require 'user_agent/browsers/facebook'
require 'user_agent/browsers/gecko'
require 'user_agent/browsers/google_home'
require 'user_agent/browsers/google_podcasts'
require 'user_agent/browsers/iheart_radio'
require 'user_agent/browsers/internet_explorer'
require 'user_agent/browsers/itunes'
require 'user_agent/browsers/libavformat'
require 'user_agent/browsers/ok_http'
require 'user_agent/browsers/opera'
require 'user_agent/browsers/overcast'
require 'user_agent/browsers/pandora'
require 'user_agent/browsers/pandora_rss_crawler'
require 'user_agent/browsers/playstation'
require 'user_agent/browsers/pocket_casts'
require 'user_agent/browsers/podcast_addict'
require 'user_agent/browsers/sonos'
require 'user_agent/browsers/spotify'
require 'user_agent/browsers/stagefright'
require 'user_agent/browsers/vivaldi'
require 'user_agent/browsers/wechat_browser'
require 'user_agent/browsers/windows_media_player'

class UserAgent
  module Browsers
    Security = {
      'N' => :none,
      'U' => :strong,
      'I' => :weak
    }.freeze

    ALL = [
      Edge,
      InternetExplorer,
      Opera,
      WechatBrowser,
      Vivaldi,
      Facebook,
      GooglePodcasts,
      GoogleHome,
      Acast,
      Airr,
      Castbox,
      Sonos,
      Alexa,
      AmazonMusic,
      PocketCasts,
      PodcastAddict,
      Spotify,
      Stagefright,
      PandoraRSSCrawler,
      Pandora,
      IHeartRadio,
      Overcast,
      Chrome,
      ITunes,
      PlayStation,
      Webkit,
      Gecko,
      WindowsMediaPlayer,
      AppleHomepod,
      AppleCoreMedia,
      Libavformat,
      OkHttp,
      AppleWatch::ATC,
      AppleWatch::Pod2Watch,
      ApplePodcasts
    ].freeze

    def self.all
      ALL
    end

    def self.extend(array)
      all.each do |extension|
        return extension.new(array) if extension.extend?(array)
      end
      array
    end
  end
end
