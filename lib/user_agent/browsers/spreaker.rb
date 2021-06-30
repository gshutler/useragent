# frozen_string_literal: true

class UserAgent
  module Browsers
    # Spreaker for Android 4.17.0 release:2021-05-05 device:phone (samsung SM-G965U; Android 10; en_US)
    # Spreaker Android
    # Spreaker 7.26.1 rv:1337 (iPhone10,3; iOS 14.4.2; en_US)
    # Spreaker 6.8.0 rv:1168 (iPad2,4; iPhone OS 9.3.5; en_GB) SPKAudioPlayer
    # Spreaker 7.9.1 rv:1263 (iPod7,1; iOS 11.0.3; en_US) SPKAudioPlayer
    # Spreaker File Downloader
    class Spreaker < Base
      IPHONE_OS     = 'iPhone OS'
      SPREAKER      = 'Spreaker'
      VERSION_REGEX = /\ASpreaker (?:for Android )?(?<version>[\d\.]+)/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == SPREAKER }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        SPREAKER
      end

      ##
      # @return [true] This is a mobile app
      def mobile?
        true
      end

      ##
      # @return [String] The OS of the app
      def os
        app = app_with_comments
        if app && app.comment[1]
          c = app.comment[1]

          return c if c.start_with?(ANDROID) || c.start_with?(IOS)
          return c.sub(IPHONE_OS, IOS) if c.start_with?(IPHONE_OS)
        end

        case platform
        when ANDROID then ANDROID
        when IOS, IPAD, IPHONE, IPOD_TOUCH then IOS
        end
      end

      ##
      # @return [String] The platform of the app
      def platform
        ua = to_s
        case ua
        when ANDROID_REGEX
          ANDROID
        when IPAD_REGEX
          IPAD
        when IPOD_REGEX
          IPOD_TOUCH
        when IPHONE_REGEX
          IPHONE
        when IOS_REGEX, DARWIN_REGEX
          IOS
        end
      end

      ##
      # @return [String] The version of the app
      def version
        matches = VERSION_REGEX.match(to_s)
        matches[:version] if matches && matches[:version]
      end
    end
  end
end
