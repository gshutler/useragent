class UserAgent
  module Browsers
    module Webkit
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == "Safari" }
      end

      def browser
        if detect_product("Chrome")
          "Chrome"
        else
          "Safari"
        end
      end

      def build
        safari.version
      end

      BuildVersions = {
        "125.12" => "1.2.4",
        "312.6" => "1.3.2",
        "412.2.2" => "2.0",
        "412.5" => "2.0.1",
        "416.13" => "2.0.2",
        "417.9.3" => "2.0.3",
        "419.3" => "2.0.4"
      }.freeze unless defined? BuildVersions

      # Prior to Safari 3, the user agent did not include a version number
      def version
        if browser == "Chrome"
          chrome.version
        elsif product = detect_product("Version")
          product.version
        else
          BuildVersions[build]
        end
      end

      def platform
        application.comment[0]
      end

      def webkit
        detect { |useragent| useragent.product == "AppleWebKit" }
      end

      def security
        Security[application.comment[1]]
      end

      def os
        OperatingSystems.normalize_os(application.comment[2])
      end

      def localization
        application.comment[3]
      end
    end
  end
end
