# frozen_string_literal: true

class UserAgent
  module Browsers
    # AndroidDownloadManager/10 (Linux; U; Android 10; HMA-AL00 Build/HUAWEIHMA-AL00)
    # AndroidDownloadManager
    class AndroidDownloadManager < Base
      ANDROID_DOWNLOAD_MANAGER = 'AndroidDownloadManager'

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == ANDROID_DOWNLOAD_MANAGER }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        ANDROID_DOWNLOAD_MANAGER
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
        app = app_with_comments
        app.comment[2] if app && app.comment[2]
      end

      ##
      # @return [String] This is an Android app
      def platform
        ANDROID
      end
    end
  end
end
