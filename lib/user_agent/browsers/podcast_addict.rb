class UserAgent
  module Browsers
    # Podcast Addict - Dalvik/1.6.0 (Linux; U; Android 4.4.2; LG-D631 Build/KOT49I.D63110b)
    # Podcast Addict - Dalvik/2.1.0 (Linux; U; Android 5.1; XT1093 Build/LPE23.32-21.3)
    # Podcast Addict - Mozilla/5.0 (Linux; U; Android 4.2.2; en-us; ALCATEL ONE TOUCH Fierce Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.2 Mobile Safari/534.30
    # Podcast Addict - Mozilla/5.0 (Linux; U; Android 4.2.2; en-ca; ALCATEL ONE TOUCH 6040A Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.2 Mobile Safari/534.30
    # Podcast Addict - Dalvik/2.1.0 (Linux; U; Android M Build/MPZ79M)
    # Mozilla/5.0 (Linux; Android 10; Lenovo TB-8705F Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/81.0.4044.138 Safari/537.36,PodcastAddict/v5 (+https://podcastaddict.com/; Android podcast app)
    # PodcastAddict/v2 - Mozilla/5.0 (Linux; U; Android 4.2.2; bg-bg; 6037Y Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.2 Mobile Safari/534.30
    # PodcastAddict/v2 - Dalvik/2.1.0 (Linux; U; Android 10; I4213 Build/53.1.A.2.2)
    class PodcastAddict < Base
      PODCAST_ADDICT         = 'Podcast Addict'
      PODCAST_ADDICT_REGEX   = /PodcastAddict/.freeze
      PODCAST_ADDICT_V_REGEX = /PodcastAddict\/v(\d+)/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        ua = agent.to_s
        ua.start_with?(PODCAST_ADDICT) || PODCAST_ADDICT_REGEX.match?(ua)
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        PODCAST_ADDICT
      end

      ##
      # @return [Array]
      #     Gets the right application
      def application
        self.reject { |agent| agent.comment.nil? || agent.comment.empty? }.first
      end

      # If we can figure out the device, return it.
      #
      # @return [nil, String] the device model
      def device
        return if application.nil?
        return unless application.comment.last.include?(' Build/')

        application.comment.last.split(' Build/').first
      end

      # If we can figure out the device build, return it.
      #
      # @return [nil, String] the device build
      def device_build
        return if application.nil?
        return unless application.comment.last.include?(' Build/')

        application.comment.last.split(' Build/').last
      end

      # This is a mobile app, always return true.
      #
      # @return [true]
      def mobile?
        true
      end

      # Gets the operating system (some variant of Android, if we're certain that is the case)
      #
      # @return [nil, String] the operating system
      def os
        if application && c = application.comment.detect { |c| OperatingSystems::ANDROID_VERSION_REGEX.match?(c) }
          OperatingSystems.normalize_os(c)
        end
      end

      ##
      # @return ["Android"] This is an Android app
      def platform
        ANDROID
      end


      # Get the security level reported
      #
      # @return [:weak, :strong, :none] the security level
      def security
        app = detect_product(DALVIK) || detect_product(MOZILLA)

        Security[app.comment[1]] if app
      end

      ##
      # @return [String]
      #     The app version if there is one
      def version
        if PODCAST_ADDICT_V_REGEX =~ self.to_s
          $1
        end
      end
    end
  end
end
