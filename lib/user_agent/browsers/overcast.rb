# frozen_string_literal: true

class UserAgent
  module Browsers
    # Overcast/3.0 (+http://overcast.fm/; iOS podcast app) BMID/E6793162B9
    # Overcast (+http://overcast.fm/; Apple Watch podcast app)
    # Overcast/857 CFNetwork/1209 Darwin/20.3.0
    # Overcast/1.0 Podcast Sync (+http://overcast.fm/)
    class Overcast < Base
      OVERCAST           = 'Overcast'
      PODCAST_SYNC_REGEX = /Podcast Sync/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == OVERCAST }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        OVERCAST
      end

      ##
      # @return [Boolean]
      #     True if it's a bot
      def bot?
        PODCAST_SYNC_REGEX.match?(self.to_s)
      end

      ##
      # @return [Boolean]
      #     This is a mobile app if not a bot
      def mobile?
        !bot?
      end

      ##
      # @return [String, nil]
      #     The operating system
      def os
        case platform
        when IOS
          darwin = detect_product(DARWIN)
          return if darwin.nil?
          
          version = OperatingSystems::Darwin::IOS[darwin.version.to_s]
          
          [IOS, version].compact.join(' ')
        # Improve when we have more samples
        # when 'Apple Watch'
        end
      end

      ##
      # @return [String]
      #     The platform
      def platform
        return if bot?

        if APPLE_WATCH_REGEX.match?(self.to_s)
          APPLE_WATCH
        else
          IOS
        end
      end
    end
  end
end
