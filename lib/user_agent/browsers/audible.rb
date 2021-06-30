# frozen_string_literal: true

class UserAgent
  module Browsers
    # com.audible.playersdk.player/3.6.0 (Linux;Android 10) ExoPlayerLib/2.12.1
    # Audible/666 CFNetwork/1220.1 Darwin/20.3.0
    # Audible, Android, 2.67.2, google, Pixel 3 XL, crosshatch, 11, 1.0, MOBILE
    class Audible < Base
      AUDIBLE        = 'Audible'
      AUDIBLE_COMMA  = 'Audible,'
      AUDIBLE_PLAYER = 'com.audible.playersdk.player'
      AUDIBLE_APPS   = [AUDIBLE, AUDIBLE_COMMA, AUDIBLE_PLAYER].freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| AUDIBLE_APPS.include?(useragent.product) }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        AUDIBLE
      end

      ##
      # @return [Boolean]
      #     This is a mobile app
      def mobile?
        true
      end

      # Gets the operating system
      #
      # @return [String, nil] the os
      def os
        app = detect_product(DARWIN)
        return [IOS, UserAgent::OperatingSystems::Darwin::IOS[app.version.to_s]].compact.join(' ') if app

        app = app_with_comments
        return OperatingSystems.normalize_os(app.comment.join) if app
      end

      # Gets the platform
      #
      # @return [String, nil] the platform
      def platform
        ua = to_s

        case ua
        when ANDROID_REGEX
          ANDROID
        when IPHONE_REGEX
          IPHONE
        when IPAD_REGEX
          IPAD
        when IPOD_REGEX
          IPOD_TOUCH
        when DARWIN_REGEX
          IOS
        end
      end

      ##
      # @return [String] the app version
      def version
        return application.version unless application.version.to_s.empty?

        parts = to_s.split(',')
        parts[2].strip if parts[2]
      end
    end
  end
end
