class UserAgent
  module Browsers
    class Samsung < Base

      SAMSUNG_BROWSER = 'SamsungBrowser'

      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == SAMSUNG_BROWSER}
      end

      def version
        self.detect { |useragent| useragent.product == SAMSUNG_BROWSER}.version
      end

      ##
      # @return [Boolean]
      #     SamsungBrowser is a mobile device
      def mobile?
        true
      end

      def browser
        SAMSUNG_BROWSER
      end

      def platform
        ANDROID
      end

      def os
        ANDROID
      end
    end
  end
end
