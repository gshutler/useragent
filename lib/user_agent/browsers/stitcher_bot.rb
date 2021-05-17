class UserAgent
  module Browsers
    # stitcherbot (http://www.stitcher.com)
    # StitcherBot (MP3 Search Bot for Stitcher Personalized Radio Service)
    class StitcherBot < Base
      STITCHER           = 'Stitcher'
      STITCHER_BOT_REGEX = /[Ss]titcher[Bb]ot/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| STITCHER_BOT_REGEX.match?(useragent.product) }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        STITCHER
      end

      ##
      # @return [True]
      #     This is a bot
      def bot?
        true
      end
    end
  end
end
