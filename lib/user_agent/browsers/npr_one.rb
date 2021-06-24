# frozen_string_literal: true

class UserAgent
  module Browsers
    # NPROneAndroid
    # NPR%20One/316 CFNetwork/1240.0.4 Darwin/20.5.0
    # Dalvik/2.1.0 (Linux; U; Android 10; GM1917 Build/QKQ1.190716.003) nprone_android/1.9.9.3/OSv:10
    # Mozilla/5.0 (Linux; Android 10; Chromecast Build/QTS2.200918.033; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/88.0.4324.181 Mobile Safari/537.36 NPR%20One/1.1.0%20%28593%29
    class NPROne < Base
      NON_VERSION_CHAR = /[^\d\.]/.freeze
      NPRONEANDROID    = 'NPROneAndroid'
      NPRONE_ANDROID   = 'nprone_android'
      NPR_20_ONE       = 'NPR%20One'
      NPR_ONE          = 'NPR One'
      PRODUCTS         = [NPRONEANDROID, NPRONE_ANDROID, NPR_20_ONE].freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| PRODUCTS.include?(useragent.product) }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        NPR_ONE
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
        if app
          os_string = [app.comment[1], app.comment[2]].compact.detect { |c| c.start_with?(ANDROID) }
          return os_string if os_string
        end

        app = detect_product(DARWIN)
        [IOS, OperatingSystems::Darwin::IOS[app.version.to_s]].compact.join(' ') if app
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
        app = detect_product(NPR_20_ONE) || detect_product(NPRONE_ANDROID)
        app.version.to_s.split(NON_VERSION_CHAR)[0] if app
      end
    end
  end
end
