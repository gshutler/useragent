# frozen_string_literal: true

class UserAgent
  module Browsers
    # AudioClip/125 CFNetwork/1240.0.4 Darwin/20.5.0
    # AudioClip/iOS/2.21.1 (iOS 14.6; iPhone)
    # AudioClip/iOS/2.20.0 (iOS 14.4.2; iPad)
    # AudioClip/iOS/2.15.1 (iOS 12.4.8; iPod touch)
    class AudioClip < Base
      AUDIO_CLIP = 'AudioClip'
      IOS_SLASH  = 'iOS/'

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == AUDIO_CLIP }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        AUDIO_CLIP
      end

      # Gets the operating system
      #
      # @return [String, nil] the os
      def os
        app = app_with_comments
        return app.comment[0] if app && app.comment[0]

        app = detect_product(DARWIN)
        [IOS, OperatingSystems::Darwin::IOS[app.version.to_s]].compact.join(' ') if app
      end

      ##
      # @return [String] The platform of the app
      def platform
        ua = to_s
        case ua
        when IPHONE_REGEX
          IPHONE
        when IPAD_REGEX
          IPAD
        when IPOD_REGEX
          IPOD_TOUCH
        when DARWIN_REGEX
          IOS
        end
      end

      ##
      # @return [String] The app version
      def version
        version = application.version.to_s
        version.start_with?(IOS_SLASH) ? version.sub(IOS_SLASH, '') : application.version
      end
    end
  end
end
