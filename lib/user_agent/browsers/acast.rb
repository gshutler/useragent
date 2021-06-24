# frozen_string_literal: true

class UserAgent
  module Browsers
    # Acast/1.63.0 (Phone; iOS 11.2.6; iPad6,11)
    # Acast/1.63.0 (Phone; iOS 11.2.5; iPhone9,4)
    # Acast/1.42.1 (phone; android 10; Google Pixel 3 XL)
    # Acast/1.26.0 (Linux;Android 9) ExoPlayerLib/2.2.0
    class Acast < Base
      ACAST = 'Acast'

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == ACAST }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        ACAST
      end

      ##
      # @return [Array]
      #     Gets the right application
      def application
        detect_product(ACAST)
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
        app = app_with_comments
        return if app.nil?

        if (os_string = app.comment.detect { |c| ANDROID_REGEX.match?(c) || IOS_REGEX.match?(c) })
          OperatingSystems.normalize_os(os_string)
        end
      end

      # Gets the platform
      #
      # @return [String, nil] the platform
      def platform
        app = app_with_comments
        return if app.nil?

        if app.comment.any? { |c| IOS_REGEX.match?(c) }
          if app.comment.any? { |c| IPAD_REGEX.match?(c) }
            IPAD
          else
            IPHONE
          end
        elsif app.comment.any? { |c| ANDROID_REGEX.match?(c) }
          ANDROID
        end
      end
    end
  end
end
