# frozen_string_literal: true

class UserAgent
  module Browsers
    # Castro 2021.4/1322
    # Castro 3.1.2/1063 Dynamo/1.0
    # Castro Downloader
    # Castro/516 CFNetwork/1237 Darwin/20.4.0
    # Castro 2, Episode Duration Lookup (iPhone; U; CPU OS 9_2 like Mac OS X; en_us)
    # Castro 2, Episode Duration Lookup BMID/E6806A66A4
    # Castro 2 Episode Download
    # Castro Episode Download (http://supertop.co/castro)
    # Castro 2 2.2/647 Like iTunes
    class Castro < Base
      CASTRO        = 'Castro'
      VERSION_REGEX = /\ACastro (?<version>[\d\.]+)/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == CASTRO }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        CASTRO
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
        return OperatingSystems.normalize_os(app.comment[2]) if app && app.comment[2]

        IOS
      end

      ##
      # @return [String] The platform of the app
      def platform
        ua = to_s
        case ua
        when IPAD_REGEX
          IPAD
        when IPOD_REGEX
          IPOD_TOUCH
        when IPHONE_REGEX
          IPHONE
        else
          IOS
        end
      end

      ##
      # @return [String] The version of the app
      def version
        app = detect_product(CASTRO)
        return app.version if app && !app.version.to_s.empty?

        ua      = to_s
        matches = VERSION_REGEX.match(ua)
        matches[:version] if matches && matches[:version]
      end
    end
  end
end
