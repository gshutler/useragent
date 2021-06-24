# frozen_string_literal: true

class UserAgent
  module Browsers
    # SoundOn/3.7.1 (Linux;Android)
    # SoundOn/1.9.11 (Linux;Android 10) ExoPlayerLib/2.9.4
    # SoundOn/1.0 (com.amphiware.sound; build:1; iOS 12.3.1) Alamofire/4.8.2
    # SoundOn/1.7.0 (com.soundon; build:3; iOS 12.4.2) Alamofire/4.8.2
    # SoundOn/2.4.1 (iOS)
    # SoundOn/1 CFNetwork/1128.0.1 Darwin/19.6.0
    # SoundOn/1.8.2
    class SoundOn < Base
      IOS_VERSION_REGEX = /iOS [\d\.]+/.freeze
      SOUND_ON          = 'SoundOn'

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == SOUND_ON }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        SOUND_ON
      end

      ##
      # @return [true] This is a mobile app
      def mobile?
        true
      end

      ##
      # @return [String] The OS of the app
      def os
        app = detect_product(DARWIN)
        return [IOS, OperatingSystems::Darwin::IOS[app.version.to_s]].compact.join(' ') if app

        app = app_with_comments
        return unless app

        case platform
        when IOS, IPHONE, IPAD, IPOD_TOUCH
          app.comment.detect { |c| IOS_VERSION_REGEX.match?(c) }
        when ANDROID
          matches = OperatingSystems::ANDROID_VERSION_REGEX.match(app.comment.join)
          [ANDROID, matches[:version]].compact.join(' ') if matches && matches[:version]
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
    end
  end
end
