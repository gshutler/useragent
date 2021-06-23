# frozen_string_literal: true

require 'user_agent/browsers/base'
require 'user_agent/browsers/webkit'

require 'user_agent/browsers/acast'
require 'user_agent/browsers/airr'
require 'user_agent/browsers/alexa'
require 'user_agent/browsers/amazon_music'
require 'user_agent/browsers/android'
require 'user_agent/browsers/android_download_manager'
require 'user_agent/browsers/apple_core_media'
require 'user_agent/browsers/apple_home_pod'
require 'user_agent/browsers/apple_podcasts'
require 'user_agent/browsers/apple_watch/base'
require 'user_agent/browsers/apple_watch/atc'
require 'user_agent/browsers/apple_watch/pod_2_watch'
require 'user_agent/browsers/audible'
require 'user_agent/browsers/audio_clip'
require 'user_agent/browsers/black_berry'
require 'user_agent/browsers/breaker'
require 'user_agent/browsers/castbox'
require 'user_agent/browsers/castro'
require 'user_agent/browsers/chrome'
require 'user_agent/browsers/deezer'
require 'user_agent/browsers/downcast'
require 'user_agent/browsers/edge'
require 'user_agent/browsers/facebook'
require 'user_agent/browsers/gecko'
require 'user_agent/browsers/google_home'
require 'user_agent/browsers/google_podcasts'
require 'user_agent/browsers/googlebot'
require 'user_agent/browsers/himalaya'
require 'user_agent/browsers/iheart_radio'
require 'user_agent/browsers/internet_explorer'
require 'user_agent/browsers/itunes'
require 'user_agent/browsers/libavformat'
require 'user_agent/browsers/luminary'
require 'user_agent/browsers/npr_one'
require 'user_agent/browsers/ok_http'
require 'user_agent/browsers/opera'
require 'user_agent/browsers/overcast'
require 'user_agent/browsers/pandora'
require 'user_agent/browsers/pandora_rss_crawler'
require 'user_agent/browsers/playstation'
require 'user_agent/browsers/pocket_casts'
require 'user_agent/browsers/podbean'
require 'user_agent/browsers/podcast_addict'
require 'user_agent/browsers/podcast_republic'
require 'user_agent/browsers/podkicker'
require 'user_agent/browsers/sonos'
require 'user_agent/browsers/spotify'
require 'user_agent/browsers/stagefright'
require 'user_agent/browsers/stitcher'
require 'user_agent/browsers/stitcher_bot'
require 'user_agent/browsers/the_podcast_app'
require 'user_agent/browsers/tune_in'
require 'user_agent/browsers/vivaldi'
require 'user_agent/browsers/wechat_browser'
require 'user_agent/browsers/windows_media_player'
require 'user_agent/browsers/wondery'

class UserAgent
  module Browsers
    Security = {
      'N' => :none,
      'U' => :strong,
      'I' => :weak
    }.freeze

    ALL = [
      Edge,
      StitcherBot,
      Stitcher,
      InternetExplorer,
      Opera,
      WechatBrowser,
      Vivaldi,
      Facebook,
      Googlebot,
      GooglePodcasts,
      GoogleHome,
      Acast,
      Airr,
      Castbox,
      Sonos,
      Alexa,
      AmazonMusic,
      Castro,
      Deezer,
      Himalaya,
      PocketCasts,
      Podbean,
      PodcastAddict,
      Spotify,
      Stagefright,
      PandoraRSSCrawler,
      Pandora,
      IHeartRadio,
      NPROne,
      Overcast,
      TuneIn,
      Chrome,
      ITunes,
      PlayStation,
      Audible,
      BlackBerry,
      Webkit,
      Gecko,
      WindowsMediaPlayer,
      AppleHomePod,
      AppleCoreMedia,
      Libavformat,
      OkHttp,
      AppleWatch::ATC,
      AppleWatch::Pod2Watch,
      ApplePodcasts,
      AndroidDownloadManager,
      AudioClip,
      Breaker,
      Downcast,
      Luminary,
      PodcastRepublic,
      Podkicker,
      ThePodcastApp,
      Wondery,
      Android
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
