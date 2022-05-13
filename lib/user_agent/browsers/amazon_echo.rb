# frozen_string_literal: true

class UserAgent
  module Browsers
    # Echo/1.0(APNG)
    # Echo/1.0(MRM)
    class AmazonEcho < Base
      ECHO = 'Echo'

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
        ECHO
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
    end
  end
end
