class UserAgent
  module Browsers
    # CastBox/4.20 (fm.castbox.audiobook.radio.podcast; build:15; iOS 14.4.0)
    # CastBox/com.castbox.CastBox (3.0.3/4.1) ; iOS 12.1.3)
    # Castbox/4.11.1 (fm.castbox.audiobook.radio.podcast; build:7; iOS 13.3.0) Alamofire/4.7.1
    # CastBox/1.3.6-170605171 (Linux;Android 6.0.1) ExoPlayerLib/2.4.0
    # CastBox/5.0.0-170114181.r651de0f BMID/E6804BD2F2
    # CastBox/5.10.4-200119035.r517c146 (Linux;Android 9.0)
    # CastBox/7.12.1-180306067 (Linux;Android 9) ExoPlayerLib/2.4.0
    class Castbox < Base
      ANDROID_REGEX     = /Android/
      CASTBOX_REGEX     = /Cast[Bb]ox/
      IOS_REGEX         = /iOS/
      IOS_VERSION_REGEX = /iOS ([\d\.]+)/
      VERSION_REGEX     = /\d+\./

      def self.extend?(agent)
        agent.detect { |useragent| CASTBOX_REGEX.match?(useragent.product) }
      end

      def browser
        'Castbox'
      end

      # Gets the right application
      def application
        self.reject { |agent| agent.comment.nil? || agent.comment.empty? }.first
      end

      ##
      # @return [True] This is a mobile app
      def mobile?
        true
      end

      # Gets the operating system
      #
      # @return [String, nil] the os
      def os
        if (application && os_string = application.comment.detect { |c| ANDROID_REGEX.match?(c) || IOS_REGEX.match?(c) })
          OperatingSystems.normalize_os(os_string)
        elsif (self.to_s =~ IOS_VERSION_REGEX)
          "iOS #{$1}"
        end
      end

      # Gets the platform
      #
      # @return [String, nil] the platform
      def platform
        ua = self.to_s
        if ANDROID_REGEX.match?(ua)
          'Android'
        elsif IOS_REGEX.match?(ua)
          'iOS'
        end
      end

      # Gets the version
      #
      # @return [String]
      def version
        if application
          VERSION_REGEX.match(application.version) ? application.version : application.comment.join
        else
          detect_product('CastBox').version
        end
      end
    end
  end
end
