class UserAgent
  module Browsers
    # Googlebot
    # Googlebot/2.1
    # Googlebot/2.1 (http://www.googlebot.com/bot.html)
    # Googlebot/2.1 ( http://www.googlebot.com/bot.html)
    # Googlebot/2.1 (+http://www.googlebot.com/bot.html)
    # Googlebot/2.1 (+http://www.google.com/bot.html)
    # Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)
    # Mozilla/5.0+(compatible;+Googlebot/2.1;++http://www.google.com/bot.html)
    # Mozilla/5.0 (compatible; Googlebot/2.1;  http://www.google.com/bot.html)
    # Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Safari/537.36
    # Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/91.0.4472.90 Safari/537.36
    class Googlebot < Base
      GOOGLEBOT = 'Googlebot'
      GOOGLEBOT_REGEX = /Googlebot\//.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        return true if agent.detect { |useragent| useragent.product == GOOGLEBOT }

        app = agent.reject { |agent| agent.comment.nil? || agent.comment.empty? }.first
        return false unless app

        GOOGLEBOT_REGEX.match?(app.comment.join)
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        GOOGLEBOT
      end

      ##
      # @return [true]
      #     This is a bot
      def bot?
        true
      end
    end
  end
end
