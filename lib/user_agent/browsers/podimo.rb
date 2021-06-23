class UserAgent
  module Browsers
    # Podimo/1.39.4 build 290/Android 30
    # Podimo/1.39.4 build 316/iOS 14.6
    # Podimo/49 CFNetwork/978.0.7 Darwin/18.7.0
    class Podimo < Base
      ANDROID_SDK_REGEX = /Android (?<sdk>[\d]+)/.freeze
      IOS_VERSION_REGEX = /iOS (?<version>[\d\.]+)/.freeze
      PODIMO            = 'Podimo'

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == PODIMO }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        PODIMO
      end

      ##
      # @return [String] The OS of the app
      def os
        app = detect_product(DARWIN)
        return [IOS, OperatingSystems::Darwin::IOS[app.version.to_s]].compact.join(' ') if app

        ua = to_s
        if platform == IOS
          matches = IOS_VERSION_REGEX.match(ua)
          [IOS, matches[:version]].compact.join(' ') if matches && matches[:version]
        elsif platform == ANDROID
          matches = ANDROID_SDK_REGEX.match(ua)
          [ANDROID, OperatingSystems::Android::SDK[matches[:sdk]]].compact.join(' ') if matches && matches[:sdk]
        end
      end

      ##
      # @return [String] The platform of the app
      def platform
        ua = to_s
        case ua
        when ANDROID_REGEX
          ANDROID
        when IOS_REGEX, DARWIN_REGEX
          IOS
        end
      end
    end
  end
end
