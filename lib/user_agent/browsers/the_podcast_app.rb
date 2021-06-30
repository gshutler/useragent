# frozen_string_literal: true

class UserAgent
  module Browsers
    # ThePodcastApp/5.6.1 (iPhone; iOS 14.6; ) player (build 4958; +https://podcast.app/)
    # ThePodcastApp/3.44.1 (iPad; iOS 13.2.2; ) stream (build 4007; +https://podcast.app/)
    # ThePodcastApp/3.45.0 (iPod touch; iOS 13.3.1; ) listenLater (build 4102; +https://podcast.app/)
    class ThePodcastApp < Base
      THE_PODCAST_APP = 'ThePodcastApp'

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == THE_PODCAST_APP }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        THE_PODCAST_APP
      end

      ##
      # @return [Boolean]
      #     This is a mobile app
      def mobile?
        true
      end

      # Gets the operating system
      #
      # @return [String, nil] the os
      def os
        app = app_with_comments
        app.comment[1] if app.comment[1]
      end

      # Gets the platform
      #
      # @return [String, nil] the platform
      def platform
        ua = to_s

        case ua
        when ANDROID_REGEX
          ANDROID
        when IPHONE_REGEX
          IPHONE
        when IPAD_REGEX
          IPAD
        when IPOD_REGEX
          IPOD_TOUCH
        when DARWIN_REGEX, IOS_REGEX
          IOS
        end
      end
    end
  end
end
