class UserAgent
  module Browsers
    # Breaker/Android/1.0.0.RC-GP-Free(72) (72)
    # Breaker/Android (https://breaker.audio)
    # Breaker/0.8.0 (1059)
    # Breaker/iOS (https://breaker.audio)
    # Breaker/515 CFNetwork/893.10 Darwin/17.3.0
    # Breaker/0.2.8 (com.Breaker.Breaker; build:0.2.8; iOS 9.3.2) Alamofire/4.0.0
    # Breaker/com.Breaker.Breaker (0.2.2; iOS 9.3.2)
    # Breaker/iOS/0.8.1 (1076)
    class Breaker < Base
      BREAKER           = 'Breaker'
      IOS_ANDROID_SLASH = /\A(iOS|Android)\//.freeze
      IOS_VERSION_REGEX = /iOS [\d\.]+/.freeze
      VERSION_REGEX     = /\A[\d\.]+/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == BREAKER }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        BREAKER
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
        app.comment[1..2].detect { |c| IOS_VERSION_REGEX.match?(c) } if app
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
        return version_string if VERSION_REGEX.match?(version_string)

        version_string.sub(IOS_ANDROID_SLASH, '') if IOS_ANDROID_SLASH.match?(version_string)
      end
    end
  end
end
