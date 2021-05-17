class UserAgent
  module Browsers
    # AlexaMediaPlayer/1.0.1560.0 (Linux;Android 10) ExoPlayerLib/1.5.9
    # AlexaMediaPlayer/1.0.2098.2 (Linux;Android 5.1.1) ExoPlayerLib/1.5.9
    # Alexa Mobile Voice/17.8.5 (Linux;Android 11) ExoPlayerLib/2.5.4
    # Alexa Mobile Voice/1.0.0 (Linux;Android 8.1.0) ExoPlayerLib/2.2.0
    class Alexa < Base
      ALEXA_MEDIA_PLAYER       = 'AlexaMediaPlayer'
      ALEXA_MOBILE_VOICE_REGEX = /Alexa Mobile Voice/.freeze
      ALEXA_REGEX              = /AlexaMediaPlayer/.freeze
      ANDROID_REGEX            = /Android/.freeze

      def self.extend?(agent)
        agent.detect { |useragent| ALEXA_REGEX.match?(useragent.product) } || ALEXA_MOBILE_VOICE_REGEX.match?(agent.to_s)
      end

      def browser
        'Alexa'
      end

      # Gets the operating system
      #
      # @return [String, nil] the os
      def os
        app = reject { |agent| agent.comment.nil? || agent.comment.empty? }.first
        return if app.nil?

        if (os_string = app.comment.detect { |c| ANDROID_REGEX.match?(c) })
          OperatingSystems.normalize_os(os_string)
        end
      end

      # Gets the platform
      #
      # @return [String] the platform
      def platform
        'Android'
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

        detect_product('Voice').version
      end
    end
  end
end
