# frozen_string_literal: true

class UserAgent
  module Browsers
    # Podverse/F-Droid Android Mobile App/
    # Podverse/Android Mobile App/Mozilla/5.0 (Linux; Android 10; LYA-L29 Build/HUAWEILYA-L29; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/90.0.4430.91 Mobile Safari/537.36
    # Podverse/7 CFNetwork/902.2 Darwin/17.7.0
    # Podverse/iOS Mobile App/Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89
    # Podverse/iOS Mobile App/Mozilla/5.0 (iPad; CPU OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148
    # Podverse/Feed Parser
    class Podverse < Base
      PODVERSE      = 'Podverse'
      VERSION_REGEX = /[\d\.]+/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == PODVERSE }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        PODVERSE
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
        return OperatingSystems.normalize_os(app.comment[1]) if app && app.comment[1]

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
        application.version if VERSION_REGEX.match?(application.version.to_s)
      end
    end
  end
end
