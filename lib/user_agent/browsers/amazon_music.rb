class UserAgent
  module Browsers
    # AmazonMusic/17.7.2 Mozilla/5.0 (Linux; Android 8.1.0; 5059X Build/O11019; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36
    # AmazonMusic/10.0.0 iPad8,9 CFNetwork/1220.1 Darwin/20.3.0
    # AmazonMusic/10.2.0 iPhone11,6 CFNetwork/1237 Darwin/20.4.0
    # AmazonMusic/1.0 x86_64 CFNetwork/1121.2.1 Darwin/19.6.0
    # AmazonMusic/16.17.1 Dalvik/2.1.0 (Linux; U; Android 7.0; LGL83BL Build/NRD90U)
    class AmazonMusic < Base
      AMAZON_MUSIC_REGEX = /AmazonMusic/
      ANDROID_REGEX      = /Android/
      DARWIN_REGEX       = /Darwin/
      IPAD_IPHONE        = %w[iPad iPhone].freeze
      IPAD_REGEX         = /iPad/
      IPHONE_REGEX       = /iPhone/

      def self.extend?(agent)
        agent.detect { |useragent| AMAZON_MUSIC_REGEX.match?(useragent.product) }
      end

      def browser
        'Amazon Music'
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
      # @return [String] the os
      def os
        if IPAD_IPHONE.include?(platform)
          app = detect_product('Darwin')
          "iOS #{UserAgent::OperatingSystems::Darwin::IOS[app.version.to_s]}" if app
        elsif platform == 'Macintosh'
          app = detect_product('Darwin')
          "macOS #{UserAgent::OperatingSystems::Darwin::MAC_OS[app.version.to_s]}" if app
        else
          app = reject { |agent| agent.comment.nil? || agent.comment.empty? }.first
          if (os_string = app.comment.detect { |c| ANDROID_REGEX.match?(c) })
            OperatingSystems.normalize_os(os_string)
          end
        end
      end

      # Gets the platform
      #
      # @return [String] the platform
      def platform
        ua = self.to_s
        return 'iPad'      if IPAD_REGEX.match?(ua)
        return 'iPhone'    if IPHONE_REGEX.match?(ua)
        return 'Macintosh' if DARWIN_REGEX.match?(ua)

        app = reject { |agent| agent.comment.nil? || agent.comment.empty? }.first
        'Android' if app && app.comment.any? { |c| ANDROID_REGEX.match?(c) }
      end
    end
  end
end
