# frozen_string_literal: true

class UserAgent
  module Browsers
    # Overcast/3.0 (+http://overcast.fm/; iOS podcast app) BMID/E6793162B9
    # Overcast (+http://overcast.fm/; Apple Watch podcast app)
    # Overcast/857 CFNetwork/1209 Darwin/20.3.0
    # Overcast/1.0 Podcast Sync (+http://overcast.fm/)
    class Overcast < Base
      APPLE_WATCH_REGEX  = /Apple Watch/
      PODCAST_SYNC_REGEX = /Podcast Sync/

      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == 'Overcast' }
      end

      def browser
        'Overcast'
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
      # @return [String]
      #     The operating system
      def os
        case platform
        when 'iOS'
          darwin = detect_product('Darwin')
          return if darwin.nil?
          version = OperatingSystems::Darwin::IOS[darwin.version.to_s]
          ['iOS', version].compact.join(' ')
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
          'Apple Watch'
        else
          'iOS'
        end
      end
    end
  end
end
