# frozen_string_literal: true

class UserAgent
  module Browsers
    # AppleCoreMedia/1.0.0.16A5288c (HomePod; U; CPU OS 12_0 like Mac OS X; en_us)
    # AppleCoreMedia/1.0.0.18L203 (HomePod; U; CPU OS 14_5 like Mac OS X; fr_fr)
    class AppleHomepod < AppleCoreMedia
      HOMEPOD_REGEX = /HomePod/

      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == 'AppleCoreMedia' } && HOMEPOD_REGEX.match?(agent.to_s)
      end

      def browser
        'HomePod'
      end
    end
  end
end
