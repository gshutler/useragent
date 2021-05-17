# frozen_string_literal: true

class UserAgent
  module Browsers
    # PandoraRSSCrawler/1.0 (podcastpartnerships@pandora.com)
    class PandoraRSSCrawler < Base
      PANDORA             = 'Pandora'
      PANDORA_RSS_CRAWLER = 'PandoraRSSCrawler'

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == PANDORA_RSS_CRAWLER }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        PANDORA
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
