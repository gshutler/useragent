# frozen_string_literal: true

class UserAgent
  module Browsers
    # Deezer Podcasters/1.0
    class DeezerCrawler < Base
      DEEZER_CRAWLER_REGEX = /Deezer Podcasters\//.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        DEEZER_CRAWLER_REGEX.match?(agent.to_s)
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        UserAgent::Browsers::Deezer::DEEZER
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
