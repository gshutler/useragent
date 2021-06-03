class UserAgent
  module Browsers
    # AlexaMediaPlayer/1.0.1560.0 (Linux;Android 10) ExoPlayerLib/1.5.9
    # AlexaMediaPlayer/1.0.2098.2 (Linux;Android 5.1.1) ExoPlayerLib/1.5.9
    # Alexa Mobile Voice/17.8.5 (Linux;Android 11) ExoPlayerLib/2.5.4
    # Alexa Mobile Voice/1.0.0 (Linux;Android 8.1.0) ExoPlayerLib/2.2.0
    class Alexa < Base
      ALEXA                    = 'Alexa'
      ALEXA_MEDIA_PLAYER       = 'AlexaMediaPlayer'
      ALEXA_MOBILE_VOICE_REGEX = /Alexa Mobile Voice/.freeze
      VOICE                    = 'Voice'

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == ALEXA_MEDIA_PLAYER } || ALEXA_MOBILE_VOICE_REGEX.match?(agent.to_s)
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        ALEXA
      end

      ##
      # @return [Boolean]
      #     True, if this is a mobile device
      def mobile?
        return false if speaker?

        super
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

      ##
      # @return [Boolean]
      #     It's a speaker for AlexaMediaPlayer, otherwise false
      def speaker?
        application.product == ALEXA_MEDIA_PLAYER
      end

      ##
      # @return [String]
      #     The app version
      def version
        return application.version if application.product == ALEXA_MEDIA_PLAYER

        voice = detect_product(VOICE)
        voice.version if voice
      end
    end
  end
end
