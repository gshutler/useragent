# frozen_string_literal: true

class UserAgent
  module Browsers
    # iHeartRadio/1 CFNetwork/1098.6 Darwin/19.0.0
    # iHeartRadio/2020040104 CFNetwork/1121.2.2 Darwin/19.3.0
    # iHeartRadio/10.2.1 (iPhone; iOS 13.4; iPhone9,3)
    # iHeartRadio/10.1.1 (iPad; iOS 14.2; iPad7,11)
    # iHeartRadio/10.1.1 (iPod touch; iOS 13.3.1; iPod9,1)
    # iHeartRadio/1.12.1 (Android Sdk 23)
    # iHeartRadio/1.0.0 (Android 10; SM-A505FN Build/QP1A.190711.020)
    # iHeartRadio/10.2.0 (Android 6.0.1; Nexus 7 Build/MMB30S)
    class IHeartRadio < Base
      IHEARTRADIO = 'iHeartRadio'
      SDK_REGEX   = /[Ss]dk (?<version>\d+)/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == IHEARTRADIO }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        IHEARTRADIO
      end

      ##
      # @return [True] This is a mobile app
      def mobile?
        true
      end

      ##
      # @return [String, nil]
      #     The operating system
      def os
        app = app_with_comments

        case platform
        when IOS
          version = OperatingSystems::Darwin::IOS[detect_product(DARWIN).version.to_s]
          [IOS, version].compact.join(' ') unless version.nil?
        when IPHONE, IPAD, IPOD_TOUCH
          OperatingSystems.normalize_os(app.comment[1])
        when ANDROID
          version = app.comment[0]
          if matches = SDK_REGEX.match(version)
            [ANDROID, OperatingSystems::Android::SDK[matches[:version]]].compact.join(' ') unless matches[:version].nil?
          else
            OperatingSystems.normalize_os(app.comment[0])
          end
        end
      end

      ##
      # @return [String, nil]
      #     The platform
      def platform
        if detect_product(DARWIN)
          IOS
        elsif detect_comment(IPHONE)
          IPHONE
        elsif detect_comment(IPAD)
          IPAD
        elsif detect_comment(IPOD_TOUCH)
          IPOD_TOUCH
        elsif detect_comment_match(ANDROID_REGEX)
          ANDROID
        end
      end
    end
  end
end
