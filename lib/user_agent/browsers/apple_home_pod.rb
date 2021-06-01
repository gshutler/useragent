# frozen_string_literal: true

class UserAgent
  module Browsers
    # AppleCoreMedia/1.0.0.16A5288c (HomePod; U; CPU OS 12_0 like Mac OS X; en_us)
    # AppleCoreMedia/1.0.0.18L203 (HomePod; U; CPU OS 14_5 like Mac OS X; fr_fr)
    class AppleHomePod < AppleCoreMedia
      APPLE_CORE_MEDIA = 'AppleCoreMedia'
      HOMEPOD          = 'HomePod'
      HOMEPOD_REGEX    = /HomePod/.freeze
      IOS_13_4         = 'iOS 13.4'

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == APPLE_CORE_MEDIA } && HOMEPOD_REGEX.match?(agent.to_s)
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        HOMEPOD
      end

      ##
      # @return [false] This is not a mobile device
      def mobile?
        false
      end

      ##
      # @return [String, nil] the os
      def os
        os_string = super
        return os_string if os_string.nil? || !os_string.start_with?(IOS) || os_string < IOS_13_4

        os_string.sub(IOS, HOME_POD_SOFTWARE)
      end

      ##
      # @return [true] HomePod is a speaker
      def speaker?
        true
      end
    end
  end
end
