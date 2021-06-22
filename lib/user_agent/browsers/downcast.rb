class UserAgent
  module Browsers
    # Downcast/2.10.3 (iPhone; iOS 14.6; Scale/3.00)
    # Downcast/2.10.1 (iPod touch; iOS 13.6; Scale/2.00)
    # Downcast/2.10.0 (iPad; iOS 14.5.1; Scale/2.00)
    # Downcast/2.10.1 (Mac OS X Version 10.15.7 (Build 19H1030))
    # Downcast/1224 CFNetwork/673.2.1 Darwin/13.1.0 (x86_64) (MacBookPro11%2C3)
    # Downcast/7276 CFNetwork/1121.2.2 Darwin/19.3.0
    class Downcast < Base
      include DesktopClassifiable

      DOWNCAST = 'Downcast'
      IDEVICES = [IPHONE, IPAD, IPOD_TOUCH].freeze
      OSX_VERSION_REGEX = /Mac OS X Version (?<version>[\d\.]+)\s/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == DOWNCAST }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        DOWNCAST
      end

      # Gets the operating system
      #
      # @return [String, nil] the os
      def os
        app = app_with_comments
        if app
          if IDEVICES.include?(app.comment[0]) && app.comment[1]
            return OperatingSystems.normalize_os(app.comment[1])
          elsif matches = OSX_VERSION_REGEX.match(app.comment[0])
            return [MAC_OS, matches[:version]].compact.join(' ') if matches[:version]
          end
        end

        app = detect_product(DARWIN)
        if app
          if X86_64_REGEX.match?(to_s)
            [MAC_OS, OperatingSystems::Darwin::MAC_OS[app.version.to_s]].compact.join(' ')
          else
            [IOS, OperatingSystems::Darwin::IOS[app.version.to_s]].compact.join(' ')
          end
        end
      end

      ##
      # @return [String, nil] The platform of the app
      def platform
        ua = to_s
        case ua
        when IPHONE_REGEX
          IPHONE
        when IPAD_REGEX
          IPAD
        when IPOD_REGEX
          IPOD_TOUCH
        when OS_X_REGEX
          MACINTOSH
        when DARWIN_REGEX
          X86_64_REGEX.match?(ua) ? MACINTOSH : IOS
        end
      end
    end
  end
end
