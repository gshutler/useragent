class UserAgent
  module Browsers
    # RadioPublic/android-2.2
    # RadioPublic/android-2.2 ,Mozilla/5.0 (Linux; Android 7.0; 5086D Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/56.0.2924.87 Mobile Safari/537.36
    # RadioPublic Android 1.0.26
    # RadioPublic/iOS-2.0
    # RadioPublic iOS 2.0.0
    # RadioPublic/1 CFNetwork/808.2.16 Darwin/16.3.0
    # RadioPublic/1.0 (com.radiopublic.app; build:50; iOS 10.0.0) Alamofire/4.0.0
    class RadioPublic < Base
      RADIO_PUBLIC      = 'RadioPublic'
      IOS_ANDROID_REGEX = /((iOS|android)-)?(?<version>[\d\.]+)/.freeze
      IOS_VERSION_REGEX = /iOS [\d\.]+/.freeze
      VERSION_REGEX     = /RadioPublic (iOS|Android) (?<version>[\d\.]+)/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == RADIO_PUBLIC }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        RADIO_PUBLIC
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
        app.comment.detect { |c| OperatingSystems::ANDROID_VERSION_REGEX.match?(c) || IOS_VERSION_REGEX.match?(c) } if app
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

      ##
      # @return [String] The version of the app
      def version
        app            = detect_product(RADIO_PUBLIC)
        version_string = app.version.to_s
        unless version_string.empty?
          matches = IOS_ANDROID_REGEX.match(version_string)
          return matches[:version] if matches && matches[:version]
        end

        ua      = to_s
        matches = VERSION_REGEX.match(ua)
        matches[:version] if matches && matches[:version]
      end
    end
  end
end
