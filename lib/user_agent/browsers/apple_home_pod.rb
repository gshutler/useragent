# frozen_string_literal: true

class UserAgent
  module Browsers
    # AppleCoreMedia/1.0.0.16A5288c (HomePod; U; CPU OS 12_0 like Mac OS X; en_us)
    # AppleCoreMedia/1.0.0.18L203 (HomePod; U; CPU OS 14_5 like Mac OS X; fr_fr)
    class AppleHomePod < AppleCoreMedia
      HOMEPOD       = 'HomePod'
      HOMEPOD_REGEX = /HomePod/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == 'AppleCoreMedia' } && HOMEPOD_REGEX.match?(agent.to_s)
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        HOMEPOD
      end

      ##
      # @return [True] HomePod is a speaker
      def speaker?
        true
      end
    end
  end
end
