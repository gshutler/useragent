# frozen_string_literal: true

class UserAgent
  module Browsers
    # PandoraRSSCrawler/1.0 (podcastpartnerships@pandora.com)
    class PandoraRSSCrawler < Base
      PANDORA_RSS_CRAWLER = 'PandoraRSSCrawler'

      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == PANDORA_RSS_CRAWLER }
      end

      def browser
        'Pandora'
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
