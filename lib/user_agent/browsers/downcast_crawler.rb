# frozen_string_literal: true

class UserAgent
  module Browsers
    # downcast feed consumer/0.0.177; (mode=dev; id=jQPkOYXFJT; downcast.fm)
    class DowncastCrawler < Base
      DOWNCAST_CRAWLER_REGEX = /\Adowncast feed consumer\//.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        DOWNCAST_CRAWLER_REGEX.match?(agent.to_s)
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        UserAgent::Browsers::Downcast::DOWNCAST
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
