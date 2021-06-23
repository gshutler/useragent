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
    # Googlebot-Audio
    # Googlebot-Image/1.0
    # Googlebot-News
    # Googlebot-Video/1.0
    class Googlebot < Base
      GOOGLEBOT       = 'Googlebot'
      GOOGLEBOT_REGEX = /Googlebot\//.freeze
      PRODUCTS_REGEX  = /Googlebot(-(Audio|Image|News|Video))?/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        return true if agent.detect { |useragent| PRODUCTS_REGEX.match?(useragent.product) }

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
