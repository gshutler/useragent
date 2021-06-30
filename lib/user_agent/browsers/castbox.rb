# frozen_string_literal: true

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
      CASTBOX           = 'Castbox'
      CASTBOX_REGEX     = /Cast[Bb]ox/.freeze
      CAST_BOX          = 'CastBox'
      IOS_VERSION_REGEX = /iOS (?<version>[\d\.]+)/.freeze
      VERSION_REGEX     = /\d+\./.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| CASTBOX_REGEX.match?(useragent.product) }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        CASTBOX
      end

      ##
      # @return [Array]
      #     Gets the right application
      def application
        app_with_comments
      end

      ##
      # @return [false] This is not a bot
      def bot?
        false
      end

      ##
      # @return [true] This is a mobile app
      def mobile?
        true
      end

      # Gets the operating system
      #
      # @return [String, nil] the os
      def os
        if (application && os_string = application.comment.detect { |c| ANDROID_REGEX.match?(c) || IOS_REGEX.match?(c) })
          OperatingSystems.normalize_os(os_string)
        elsif matches = IOS_VERSION_REGEX.match(to_s)
          [IOS, matches[:version]].compact.join(' ') unless matches[:version].nil?
        end
      end

      # Gets the platform
      #
      # @return [String, nil] the platform
      def platform
        ua = self.to_s
        if ANDROID_REGEX.match?(ua)
          ANDROID
        elsif IOS_REGEX.match?(ua)
          IOS
        end
      end

      # Gets the version
      #
      # @return [String]
      def version
        if application
          VERSION_REGEX.match(application.version) ? application.version : application.comment.join
        else
          detect_product(CAST_BOX)&.version
        end
      end
    end
  end
end
