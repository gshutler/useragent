class UserAgent
  module Browsers
    # AmazonMusic/17.7.2 Mozilla/5.0 (Linux; Android 8.1.0; 5059X Build/O11019; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36
    # AmazonMusic/10.0.0 iPad8,9 CFNetwork/1220.1 Darwin/20.3.0
    # AmazonMusic/10.2.0 iPhone11,6 CFNetwork/1237 Darwin/20.4.0
    # AmazonMusic/1.0 x86_64 CFNetwork/1121.2.1 Darwin/19.6.0
    # AmazonMusic/16.17.1 Dalvik/2.1.0 (Linux; U; Android 7.0; LGL83BL Build/NRD90U)
    # AmazonMusic
    class AmazonMusic < Base
      include DesktopClassifiable

      AMAZONMUSIC  = 'AmazonMusic'
      AMAZON_MUSIC = 'Amazon Music'
      IPAD_IPHONE  = %w[iPad iPhone].freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == AMAZONMUSIC }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        AMAZON_MUSIC
      end

      ##
      # @return [Boolean]
      #     True if it's a mobile
      def mobile?
        return true if IPAD_IPHONE.include?(platform)
        super
      end

      # Gets the operating system
      #
      # @return [String, nil] the os
      def os
        if IPAD_IPHONE.include?(platform) && app = detect_product(DARWIN)
          [IOS, UserAgent::OperatingSystems::Darwin::IOS[app.version.to_s]].compact.join(' ')
        elsif platform == MACINTOSH && app = detect_product(DARWIN)
          [MAC_OS, UserAgent::OperatingSystems::Darwin::MAC_OS[app.version.to_s]].compact.join(' ')
        else
          app = app_with_comments
          if (app && os_string = app.comment.detect { |c| ANDROID_REGEX.match?(c) })
            OperatingSystems.normalize_os(os_string)
          end
        end
      end

      # Gets the platform
      #
      # @return [String, nil] the platform
      def platform
        ua = self.to_s
        return IPAD      if IPAD_REGEX.match?(ua)
        return IPHONE    if IPHONE_REGEX.match?(ua)
        return MACINTOSH if DARWIN_REGEX.match?(ua)

        app = app_with_comments
        ANDROID if app && app.comment.any? { |c| ANDROID_REGEX.match?(c) }
      end
    end
  end
end
