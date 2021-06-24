# frozen_string_literal: true

class UserAgent
  module Browsers
    # iCatcher!/6.7.5 (iPhone; iOS 14.5.1; Scale/2.0)
    # iCatcher!/3.0.7 (iPad; iOS 11.0; Scale/2.0)
    # iCatcher!/3.5.1 (iPod touch; iOS 11.3; Scale/2.0)
    # iCatcher! 1.8.4 (iPhone; iPhone OS 4.2.1; en_US)
    # iCatcher! 1.9.8.5 (iPod touch; iPhone OS 6.1.2; en_US)
    # icatcher/1.10 CFNetwork/758.5.3 Darwin/15.6.0
    # iCatcher! podcast app/2.2.5
    # iCatcher! Podcast Player/2.7.3
    class ICatcher < Base
      ICATCHER       = 'iCatcher!'
      ICATCHER_LOWER = 'icatcher'
      IPHONE_OS      = 'iPhone OS'
      VERSION_REGEX  = /iCatcher! (podcast app\/|Podcast Player\/)?(?<version>[\d\.]+)/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == ICATCHER || useragent.product == ICATCHER_LOWER }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        ICATCHER
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
        return unless app && app.comment[1]

        os_string = app.comment[1]
        return os_string if os_string.start_with?(IOS)
        os_string.sub(IPHONE_OS, IOS) if os_string.start_with?(IPHONE_OS)
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
        app = detect_product(ICATCHER_LOWER) || detect_product(ICATCHER)
        return app.version unless app.version.to_s.empty?

        matches = VERSION_REGEX.match(to_s)
        matches[:version] if matches && matches[:version]
      end
    end
  end
end
