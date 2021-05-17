class UserAgent
  module Browsers
    # Spotify/0.1.118.48 Android/29 (Pixel 4 XL)
    # Spotify/1.10.0 iOS/12.3.1 (Stations iPhone11,2)
    # Spotify/8.4.62 iOS/12.5.1 (iPod7,1)
    # Spotify/8.4.75 iOS/14.3 (iPad7,11)
    # Spotify/107700336 OSX/0 (MacBookAir7,2)
    # Spotify/107700338 Linux/0 (PC desktop)
    # Spotify/107700338 Win32/0 (PC laptop)
    # Spotify-Lite/0.13.30.53 Android/28 (SM-A750GN)
    # Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Spotify/1.1.45.621 Safari/537.36
    # Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Spotify/1.1.31.703 Safari/537.36
    # Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Spotify/1.1.10.546 Safari/537.36
    # Spotify/1.0
    class Spotify < Base
      include DesktopClassifiable

      SPOTIFY      = 'Spotify'
      SPOTIFY_LITE = 'Spotify-Lite'
      WIN32        = 'Win32'

      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == SPOTIFY || useragent.product == SPOTIFY_LITE }
      end

      def browser
        SPOTIFY
      end

      ##
      # @return [String, nil]
      #     The operating system
      def os
        if app = detect_product(ANDROID)
          "#{ANDROID} #{OperatingSystems::Android::SDK[app.version.to_s]}"
        elsif app = detect_product(IOS)
          "#{IOS} #{app.version.to_s}"
        elsif app = reject { |agent| agent.comment.nil? || agent.comment.empty? }.first
          if WINDOWS_NT_REGEX.match?(app.comment[0])
            OperatingSystems.normalize_os(application.comment[0])
          elsif !app.comment[1].nil?
            OperatingSystems.normalize_os(application.comment[1])
          end
        end
      end

      ##
      # @return [String, nil]
      #     The platform
      def platform
        app     = reject { |agent| agent.comment.nil? || agent.comment.empty? }.first
        comment = app.comment.join unless app.nil? || app.comment.nil?

        if detect_product(ANDROID)
          ANDROID
        elsif detect_product(OSX) || MACINTOSH_REGEX.match?(comment)
          MACINTOSH
        elsif detect_product(LINUX)
          LINUX
        elsif detect_product(WIN32) || WINDOWS_REGEX.match?(comment)
          WINDOWS
        elsif X11_REGEX.match?(comment)
          X11
        elsif app = detect_product(IOS)
          comment = app.comment.join unless app.comment.nil?
          if IPHONE_REGEX.match?(comment)
            IPHONE
          elsif IPAD_REGEX.match?(comment)
            IPAD
          elsif IPOD_REGEX.match?(comment)
            IPOD_TOUCH
          else
            IOS
          end
        end
      end

      ##
      # @return [String]
      #     The version
      def version
        (detect_product(SPOTIFY) || detect_product(SPOTIFY_LITE)).version
      end
    end
  end
end
