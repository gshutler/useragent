# frozen_string_literal: true

class UserAgent
  module Browsers
    # RadioPublic-Web/e0d2cd1
    class RadioPublicCrawler < Base
      RADIO_PUBLIC_WEB = 'RadioPublic-Web'

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == RADIO_PUBLIC_WEB }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        UserAgent::Browsers::RadioPublic::RADIO_PUBLIC
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
