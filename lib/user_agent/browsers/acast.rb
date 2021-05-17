class UserAgent
  module Browsers
    # Acast/1.63.0 (Phone; iOS 11.2.6; iPad6,11)
    # Acast/1.63.0 (Phone; iOS 11.2.5; iPhone9,4)
    # Acast/1.42.1 (phone; android 10; Google Pixel 3 XL)
    # Acast/1.26.0 (Linux;Android 9) ExoPlayerLib/2.2.0
    class Acast < Base
      ACAST_REGEX   = /Acast/
      ANDROID_REGEX = /[Aa]ndroid/
      IOS_REGEX     = /iOS/
      IPAD_REGEX    = /iPad/

      def self.extend?(agent)
        agent.detect { |useragent| ACAST_REGEX.match?(useragent.product) }
      end

      def browser
        'Acast'
      end

      # Gets the right application
      def application
        detect_product('Acast')
      end

      ##
      # @return [Boolean] true for mobile
      def mobile?
        true
      end

      # Gets the operating system
      #
      # @return [String, nil] the os
      def os
        app = reject { |agent| agent.comment.nil? || agent.comment.empty? }.first
        return if app.nil?

        if (os_string = app.comment.detect { |c| ANDROID_REGEX.match?(c) || IOS_REGEX.match?(c) })
          OperatingSystems.normalize_os(os_string)
        end
      end

      # Gets the platform
      #
      # @return [String, nil] the platform
      def platform
        app = reject { |agent| agent.comment.nil? || agent.comment.empty? }.first
        return if app.nil?

        if app.comment.any? { |c| IOS_REGEX.match?(c) }
          if app.comment.any? { |c| IPAD_REGEX.match?(c) }
            'iPad'
          else
            'iPhone'
          end
        elsif app.comment.any? { |c| ANDROID_REGEX.match?(c) }
          'Android'
        end
      end
    end
  end
end
