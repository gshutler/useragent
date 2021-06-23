class UserAgent
  module Browsers
    # Himalaya/2.4.82 Android/29 (EVR-L29)
    # Mozilla/5.0 (Linux; Android 10; SM-A115M Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/90.0.4430.82 Mobile Safari/537.36 Himalaya/2.4.70
    # Himalaya/1 CFNetwork/1236 Darwin/20.4.0
    # Himalaya/2.4.80 (iPhone; iOS 14.4.2; Scale/2.00; CFNetwork; iPhone10,1)
    # Himalaya/2.2.10 (iPad; iOS 12.0.1; Scale/2.00; CFNetwork; iPad6,11)
    # Himalaya/2.2.15 (iPod touch; iOS 11.4; Scale/2.00; CFNetwork; iPod7,1)
    class Himalaya < Base
      HIMALAYA = 'Himalaya'

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == HIMALAYA }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        HIMALAYA
      end

      ##
      # @return [String] The OS of the app
      def os
        app = app_with_comments
        return app.comment[1] if app && app.comment[1]

        app = detect_product(DARWIN)
        return [IOS, OperatingSystems::Darwin::IOS[app.version.to_s]].compact.join(' ') if app

        app = detect_product(ANDROID)
        [ANDROID, OperatingSystems::Android::SDK[app.version.to_s]].compact.join(' ') if app
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
        when DARWIN_REGEX
          IOS
        end
      end

      ##
      # @return [String] The version of the app
      def version
        detect_product(HIMALAYA).version
      end
    end
  end
end
