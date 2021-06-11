class UserAgent
  module Browsers
    # ExoPlayerWrapper/5.4.9 (Linux;Android 10) ExoPlayerLib/2.11.5
    # Dalvik/2.1.0 (Linux; U; Android 11; SM-G991N Build/RP1A.200720.012)
    # de.danoeh.antennapod/1.8.1 (Linux;Android 10) ExoPlayerLib/2.10.8)
    # radio.de/app-5.4.2.5 (Linux;Android 7.0) ExoPlayerLib/2.13.3)
    class Android < Base
      EXO_PLAYER_LIB = 'ExoPlayerLib'

      # List of product known to be Android
      ANDROID_PRODUCTS = [EXO_PLAYER_LIB, DALVIK].freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| ANDROID_PRODUCTS.include?(useragent.product) }
      end

      ##
      # @return [Boolean]
      #     Android is a mobile device
      def mobile?
        true
      end

      # Gets the operating system
      #
      # @return [String, nil] the os
      def os
        app = app_with_comments
        return if app.nil?

        if (os_string = app.comment.detect { |c| ANDROID_REGEX.match?(c) })
          OperatingSystems.normalize_os(os_string)
        end
      end

      # Gets the platform
      #
      # @return [String] the platform
      def platform
        ANDROID
      end
    end
  end
end
