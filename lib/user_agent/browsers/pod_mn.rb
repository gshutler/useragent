# frozen_string_literal: true

class UserAgent
  module Browsers
    # PodMN/Android 1.3.1 (Android 11; SM-G970U Build/RP1A.200720.012)
    # PodMN/1.2.0 (Linux;Android 9) ExoPlayerLib/2.9.6
    # PodMN/iOS 1.1.8 (iPhone 8/14.6)
    # PodMN/iOS 1.1.8 (iPad Pro 9.7"/14.4.2)
    # PodMN/1 CFNetwork/1121.2.2 Darwin/19.3.0
    class PodMN < Base
      POD_MN        = 'PodMN'
      VERSION_REGEX = /\APodMN\/(iOS|Android) (?<version>[\d\.]+)/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == POD_MN }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        POD_MN
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
          version = app.comment.join.split('/')[1]
          [IOS, version].compact.join(' ') if version
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

      ##
      # @return [String] The version of the app
      def version
        version_string = application.version.to_s
        return application.version unless version_string == ANDROID || version_string == IOS

        matches = VERSION_REGEX.match(to_s)
        matches[:version] if matches && matches[:version]
      end
    end
  end
end
