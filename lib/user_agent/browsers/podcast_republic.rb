class UserAgent
  module Browsers
    # PodcastRepublic/18.0 (Linux; U; Android 11;blueline/RQ2A.210505.002)
    # PodcastRepublic/18.0 (Linux; U; Android 9;J8210/55.0.A.11.25)
    class PodcastRepublic < Base
      PODCAST_REPUBLIC = 'Podcast Republic'
      PODCASTREPUBLIC  = 'PodcastRepublic'

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == PODCASTREPUBLIC }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        PODCAST_REPUBLIC
      end

      # Gets the operating system
      #
      # @return [String, nil] the os
      def os
        app = app_with_comments
        return unless app

        OperatingSystems.normalize_os(app.comment[2]) if app.comment[2]
      end

      # Gets the platform
      #
      # @return [String] This is an Android app
      def platform
        ANDROID
      end
    end
  end
end
