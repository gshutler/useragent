class UserAgent
  module Browsers
    # Luminary/33.0 (Android 9; SM-G950F; samsung dreamlte; en)
    # Luminary/1.0.10 build 1377/Android SDK 28
    # Luminary/39.0 build 252/iOS 14.6
    # Luminary/252 CFNetwork/1240.0.4 Darwin/20.5.0
    # Luminary/0.0.243 build 3319
    class Luminary < Base
      ANDROID_SDK_REGEX = /Android SDK (?<sdk>[\d]+)/.freeze
      IOS_VERSION_REGEX = /iOS\s(?<version>[\d\.]+)/.freeze
      LUMINARY          = 'Luminary'

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == LUMINARY }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        LUMINARY
      end

      ##
      # @return [true] This is a mobile app
      def mobile?
        true
      end

      # Gets the operating system
      #
      # @return [String, nil] the os
      def os
        app = app_with_comments
        return app.comment[0] if app

        app = detect_product(DARWIN)
        return [IOS, OperatingSystems::Darwin::IOS[app.version.to_s]].compact.join(' ') if app

        ua = to_s
        if matches = IOS_VERSION_REGEX.match(ua)
          [IOS, matches[:version]].compact.join(' ') if matches[:version]
        elsif matches = ANDROID_SDK_REGEX.match(ua)
          [ANDROID, OperatingSystems::Android::SDK[matches[:sdk]]].compact.join(' ') if matches[:sdk]
        end
      end

      ##
      # @return [String] This is an Android app
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
