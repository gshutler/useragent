class UserAgent
  module Browsers
    # stitcherbot (http://www.stitcher.com)
    # StitcherBot (MP3 Search Bot for Stitcher Personalized Radio Service)
    class StitcherBot < Base
      STITCHER_BOT_REGEX = /[Ss]titcher[Bb]ot/

      def self.extend?(agent)
        agent.detect { |useragent| STITCHER_BOT_REGEX.match?(useragent.product) }
      end

      def browser
        'Stitcher'
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
