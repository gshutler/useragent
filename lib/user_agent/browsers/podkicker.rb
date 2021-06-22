class UserAgent
  module Browsers
    # Podkicker Pro/3.1.19.RC-GP-Pro(2028)
    # Podkicker/2.2.10
    # Podkicker Classic/1.2.9
    class Podkicker < Base
      CLASSIC         = 'Classic'
      PODKICKER       = 'Podkicker'
      PODKICKER_REGEX = /Podkicker (Pro|Classic)\//.freeze
      PRO             = 'Pro'

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == PODKICKER } || PODKICKER_REGEX.match?(agent.to_s)
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        PODKICKER
      end

      ##
      # @return [true] This is a mobile app
      def mobile?
        true
      end

      ##
      # @return [String] This is an Android app
      def platform
        ANDROID
      end

      ##
      # @return [String] The version of the app
      def version
        app = detect_product(PRO) || detect_product(CLASSIC) || detect_product(PODKICKER)
        app.version if app
      end
    end
  end
end
