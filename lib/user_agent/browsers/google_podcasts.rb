class UserAgent
  module Browsers
    # Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) GSA/42.0.183854831 Mobile/13G36 Safari/601.1
    # Mozilla/5.0 (iPad; CPU OS 9_0_2 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) GSA/6.0.51363 Mobile/13A452 Safari/600.1.4
    # Mozilla/5.0 (Linux; Android 5.0.2; LG-V496 Build/LRX22G; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/53.0.2785.97 Safari/537.36 GSA/6.3.36.21.arm
    # Mozilla/5.0 (Linux; Android 8.1.0; Pixel Build/OPM2.171019.029; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36 GSA/7.8.26.21.arm64
    # GooglePodcasts/2.0.10 iPad/14.5 hw/iPad6_3
    # GooglePodcasts/2.0.10 iPhone/12.1 hw/iPhone11_2
    # GooglePodcasts/2.0.9 iPod_touch/14.4.1 hw/iPod9_1
    class GooglePodcasts < Webkit
      GOOGLE_PODCASTS = 'Google Podcasts'
      GOOGLEPODCASTS  = 'GooglePodcasts'
      GSA             = 'GSA'

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == GSA || useragent.product == GOOGLEPODCASTS }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        GOOGLE_PODCASTS # Google wants their agent to be reported as "Google Podcasts"
      end

      ##
      # @return [false] This is not a bot
      def bot?
        false
      end

      ##
      # @return [true] This is a mobile app
      def mobile?
        true
      end

      ##
      # @return [String, nil]
      #     The OS version
      def os
        if application
          if application.comment[2].nil?
            OperatingSystems.normalize_os(application.comment[1])
          elsif ANDROID_REGEX.match?(application.comment[1])
            OperatingSystems.normalize_os(application.comment[1])
          end
        else
          app = detect_product(IPHONE) || detect_product(IPAD) || detect_product(IPODTOUCH)
          [IOS, app.version].compact.join(' ') if app && app.version
        end
      end

      ##
      # @return [String, nil]
      #     The platform
      def platform
        if application && application.comment
          if application.comment.any? { |c| IPHONE_REGEX.match?(c) }
            IPHONE
          elsif application.comment.any? { |c| IPAD_REGEX.match?(c) }
            IPAD
          elsif application.comment.any? { |c| ANDROID_REGEX.match?(c) }
            ANDROID
          end
        else
          if detect_product(IPHONE)
            IPHONE
          elsif detect_product(IPAD)
            IPAD
          elsif detect_product(IPODTOUCH)
            IPOD_TOUCH
          end
        end
      end

      # Gets the application version
      def version
        app = detect_product(GSA) || detect_product(GOOGLEPODCASTS)
        app.version
      end
    end
  end
end
