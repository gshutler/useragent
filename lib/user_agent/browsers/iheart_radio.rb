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
      SDK_REGEX = /[Ss]dk (\d+)/.freeze

      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == 'iHeartRadio' }
      end

      def browser
        'iHeartRadio'
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
        app = reject { |agent| agent.comment.nil? || agent.comment.empty? }.first

        case platform
        when 'iOS'
          version = OperatingSystems::Darwin::IOS[detect_product('Darwin').version.to_s]
          ['iOS', version].compact.join(' ')
        when 'iPhone', 'iPad', 'iPod touch'
          OperatingSystems.normalize_os(app.comment[1])
        when 'Android'
          version = app.comment[0]
          if version =~ SDK_REGEX
            "Android #{OperatingSystems::Android::SDK[$1]}"
          else
            OperatingSystems.normalize_os(app.comment[0])
          end
        end
      end

      ##
      # @return [String, nil]
      #     The platform
      def platform
        if detect_product('Darwin')
          'iOS'
        elsif detect_comment('iPhone')
          'iPhone'
        elsif detect_comment('iPad')
          'iPad'
        elsif detect_comment('iPod touch')
          'iPod touch'
        elsif detect_comment_match(/Android/)
          'Android'
        end
      end
    end
  end
end
