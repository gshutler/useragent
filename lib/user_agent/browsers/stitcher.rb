class UserAgent
  module Browsers
    # Stitcher/iOS BMID/E675DDB007
    # Stitcher/Android BMID/E675CE27E9
    # Stitcher/17434 CFNetwork/609.1.4 Darwin/13.0.0
    # StitcherX/109 CFNetwork/1128.0.1 Darwin/19.6.0
    # stitcherx/52 CFNetwork/1121.2.1 Darwin/19.3.0
    # Stitcher Demo/4.8.0 (Linux;Android 11) ExoPlayerLib/2.10.7
    # Stitcher X/1.2 (Linux;Android 9) ExoPlayerLib/2.10.7
    # Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) StitcherRadio/1.1.5 Chrome/58.0.3029.110 Molecule/1.1.5 Safari/537.36
    # Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 10.0; Trident/4.0) Stitcher/iOS
    # Stitcher/iOS,Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.2; WOW64; Trident/6.0; .NET4.0E; .NET4.0C; InfoPath.2)
    # StitcherTV/1 CFNetwork/1121.1.2 Darwin/19.2.0 (x86_64)
    class Stitcher < Base
      include DesktopClassifiable

      STITCHER_REGEX        = /[Ss]titcher([Xx]|Radio|TV)?/
      STITCHER_DEMO_X_REGEX = /Stitcher\ (Demo|X)/

      def self.extend?(agent)
        agent.detect { |useragent| STITCHER_REGEX.match?(useragent.product) } || STITCHER_DEMO_X_REGEX.match?(agent.to_s)
      end

      def browser
        'Stitcher'
      end

      ##
      # @return [Boolean]
      #     True if this is a mobile app
      def mobile?
        ua = self.to_s
        /(iOS|Android|Darwin)/.match?(ua) && !/x86_64/.match?(ua)
      end

      ##
      # @return [String, nil]
      #     The operating system
      def os
        if app = detect_product('Darwin')
          comment = app.comment.join unless app.comment.nil?
          if /x86_64/.match?(comment)
            "macOS #{OperatingSystems::Darwin::MAC_OS[app.version.to_s]}"
          else
            "iOS #{OperatingSystems::Darwin::IOS[app.version.to_s]}"
          end
        elsif app = reject { |agent| agent.comment.nil? || agent.comment.empty? }.first
          if /Macintosh/.match?(app.comment[0])
            OperatingSystems.normalize_os(app.comment[1])
          elsif /Android/.match?(app.comment[0])
            OperatingSystems.normalize_os(app.comment[0])
          end
        end
      end

      ##
      # @return [String, nil]
      #     The platform
      def platform
        ua = self.to_s
        if /iOS/.match?(ua)
          'iOS'
        elsif /Android/.match?(ua)
          'Android'
        elsif app = detect_product('Darwin')
          comment = app.comment.join unless app.comment.nil?
          /x86_64/.match?(comment) ? 'Macintosh' : 'iOS'
        elsif app = reject { |agent| agent.comment.nil? || agent.comment.empty? }.first
          'Macintosh' if /Macintosh/.match?(app.comment.join)
        end
      end

      ##
      # @return [String]
      #     The version
      def version
        if app = detect_product('Demo') || detect_product('X')
          app.version
        elsif app = detect { |product| STITCHER_REGEX.match?(product) }
          app.version unless /(iOS|Android)/.match?(app.version.to_s)
        end
      end
    end
  end
end
