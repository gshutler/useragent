class UserAgent
  module Browsers
    class Chrome < Base
      def self.extend?(agent)
        agent.detect do |useragent|
          %w[Chrome CriOS].include?(useragent.product)
        end
      end

      CHROME_BROWSERS = %w[
        Iron
      ].freeze

      def ChromeBrowsers # rubocop:disable Naming/MethodName
        warn("#{__method__} is deprecated. Please use CHROME_BROWSERS instead")
        CHROME_BROWSERS
      end

      def browser
        CHROME_BROWSERS.detect { |browser| respond_to?(browser) } || "Chrome"
      end

      def build
        webkit.version
      end

      # Prior to Safari 3, the user agent did not include a version number
      def version
        str = if detect_product("CriOs")
                crios.version
              else
                chrome.version
              end

        Version.new(str)
      end

      def application
        reject { |agent| agent.comment.nil? || agent.comment.empty? }.first
      end

      def platform
        return unless application

        if application.comment[0] =~ /Windows/
          "Windows"
        elsif application.comment.any? { |c| c =~ /CrOS/ }
          "ChromeOS"
        elsif application.comment.any? { |c| c =~ /Android/ }
          "Android"
        else
          application.comment[0]
        end
      end

      def webkit
        detect { |useragent| useragent.product == "AppleWebKit" }
      end

      def os
        return unless application

        if application.comment[0] =~ /Windows NT/
          OperatingSystems.normalize_os(application.comment[0])
        elsif application.comment[2].nil?
          OperatingSystems.normalize_os(application.comment[1])
        elsif application.comment[1] =~ /Android/
          OperatingSystems.normalize_os(application.comment[1])
        else
          OperatingSystems.normalize_os(application.comment[2])
        end
      end

      def localization
        return unless application

        application.comment[3]
      end
    end
  end
end
