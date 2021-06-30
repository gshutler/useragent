# frozen_string_literal: true

class UserAgent
  module Browsers
    # BlackBerry8520/5.0.0.681 Profile/MIDP-2.1 Configuration/CLDC-1.1 VendorID/600
    # BlackBerry9630/5.0.0.975 Profile/MIDP-2.1 Configuration/CLDC-1.1 VendorID/105
    # BlackBerry9550/4.2.0.442 Profile/MIDP-2.0 Configuration/CLDC-1.1/UC Browser7.8.0.95/161/352
    class BlackBerry < Base
      BLACKBERRY        = 'BlackBerry'
      BLACK_BERRY_REGEX = /BlackBerry[\d]+/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| BLACK_BERRY_REGEX.match?(useragent.product) }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        BLACKBERRY
      end

      ##
      # @return [Boolean]
      #     BlackBerry is a mobile device
      def mobile?
        true
      end

      # Gets the platform
      #
      # @return [String] the platform
      def platform
        BLACKBERRY
      end
    end
  end
end
