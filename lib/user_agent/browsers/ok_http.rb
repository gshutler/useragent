# frozen_string_literal: true

class UserAgent
  module Browsers
    # okhttp/3.8.1
    # okhttp/3.10.0 BMID/E67925BB27
    # okhttp/3.8.1 Dalvik/2.1.0 (Linux; U; Android 7.1.1; vivo X20A Build/NMF26X) baiduboxapp/10.1.0.11 (Baidu; P1 7.1.1)
    # okhttp/2.7.5 nyt-android/6.19.3 ,okhttp/2.7.5 nyt-android/6.19.3
    # NRC Audio/1.0.14 (nl.nrc.audio; build:19; Android 11; Sdk:30; Manufacturer:samsung; Model: SM-A515F) OkHttp/4.9.0
    class OkHttp < Base
      OKHTTP_BROWSER = 'OkHttp'
      OKHTTP_REGEX   = /[oO]k[hH]ttp/.freeze

      class << self
        ##
        # Check if this class usable for the useragent
        #
        # @return [Boolean] true if this is the right class for the useragent
        def extend?(agent)
          agent.detect { |useragent| OKHTTP_REGEX.match?(useragent.product) }
        end
      end

      ##
      # @return [String] The browser to report
      def browser
        OKHTTP_BROWSER
      end

      # Find the right application
      def application
        app_with_comments
      end

      ##
      # @return [false] This is not a bot
      def bot?
        false
      end

      ##
      # @return [Boolean] This is mobile if platform is Android
      def mobile?
        platform == ANDROID
      end

      # Return the platform
      #
      # @return [String]
      def platform
        ANDROID if ANDROID_REGEX.match?(to_s)
      end

      # Return the operating system
      #
      # @return [String]
      def os
        return unless application

        if application.comment[2].nil?
          OperatingSystems.normalize_os(application.comment[1])
        elsif ANDROID_REGEX.match?(application.comment[1])
          OperatingSystems.normalize_os(application.comment[1])
        else
          OperatingSystems.normalize_os(application.comment[2])
        end
      end

      # Return the application version if any
      #
      # @return [String]
      def version
        detect { |useragent| OKHTTP_REGEX.match?(useragent.product) }.version
      end
    end
  end
end
