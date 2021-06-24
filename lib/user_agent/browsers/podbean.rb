# frozen_string_literal: true

class UserAgent
  module Browsers
    # Podbean/Android App 8.5.1 (http://podbean.com),a3d7ec202761774354efde899ad29a6a
    # Podbean/Android App (http://podbean.com) ,099c49b02ed4a2d7da8a9bbb11a47
    # Podbean/Android App 5.7.1 (http://podbean.com) ,8f16fbdcbb38da97ec2bea119b3890fe/5.7.1 (Linux;Android 7.0) ExoPlayerLib/2.6.0
    # Podbean/iOS (http://podbean.com) 5.3.9 - 4726c87b825e77fda656723a2d6eb484
    # Podbean/iOS (http://podbean.com) 5.0 - 8f16fbdc25e77fdd4a2d6723a2d6eb484
    # Podbean/1374 CFNetwork/978.0.7 Darwin/18.7.0
    class Podbean < Base
      PODBEAN             = 'Podbean'
      VERSION_REGEX       = /[\d\.]+/.freeze
      VERSION_SPACE_REGEX = /\s(?<version>[\d\.]+)\s/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == PODBEAN }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        PODBEAN
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
        app = detect_product(DARWIN)
        return [IOS, UserAgent::OperatingSystems::Darwin::IOS[app.version.to_s]].compact.join(' ') if app

        app = reject { |agent| agent.comment.nil? || agent.comment.empty? || !ANDROID_REGEX.match?(agent.comment.join) }.first
        return OperatingSystems.normalize_os(app.comment.join) if app
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

      ##
      # @return [String] the app version
      def version
        return application.version if VERSION_REGEX.match?(application.version.to_s)

        ua      = to_s
        matches = VERSION_SPACE_REGEX.match(ua)
        matches[:version] if matches && matches[:version]
      end
    end
  end
end
