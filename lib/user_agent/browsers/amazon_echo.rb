# frozen_string_literal: true

class UserAgent
  module Browsers
    # Echo/1.0(APNG)
    # Echo/1.0(MRM)
    class AmazonEcho < Base
      AMAZON_ECHO = 'Amazon Echo'
      private_constant :AMAZON_ECHO

      ECHO = 'Echo'
      private_constant :ECHO

      VERSION_REGEX = /(?<version>[\d.]+)/.freeze
      private_constant :VERSION_REGEX

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == ECHO }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        AMAZON_ECHO
      end

      ##
      # @return [false] This is not a mobile device
      def mobile?
        false
      end

      ##
      # @return [true] This is a speaker
      def speaker?
        true
      end

      ##
      # @return [String]
      #     The app version
      def version
        v = super.to_s
        VERSION_REGEX.match(v)[:version]
      end
    end
  end
end
