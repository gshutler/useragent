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

      DEMO                  = 'DEMO'
      MOBILE_REGEX          = /(iOS|Android|Darwin)/.freeze
      STITCHER              = 'Stitcher'
      STITCHER_DEMO_X_REGEX = /Stitcher\ (Demo|X)/.freeze
      STITCHER_REGEX        = /[Ss]titcher([Xx]|Radio|TV)?/.freeze
      X                     = 'X'

      def self.extend?(agent)
        agent.detect { |useragent| STITCHER_REGEX.match?(useragent.product) } || STITCHER_DEMO_X_REGEX.match?(agent.to_s)
      end

      def browser
        STITCHER
      end

      ##
      # @return [Boolean]
      #     True if this is a mobile app
      def mobile?
        ua = self.to_s
        MOBILE_REGEX.match?(ua) && !X86_64_REGEX.match?(ua)
      end

      ##
      # @return [String, nil]
      #     The operating system
      def os
        if app = detect_product(DARWIN)
          comment = app.comment.join unless app.comment.nil?
          if X86_64_REGEX.match?(comment)
            [MAC_OS, OperatingSystems::Darwin::MAC_OS[app.version.to_s]].compact.join(' ')
          else
            [IOS, OperatingSystems::Darwin::IOS[app.version.to_s]].compact.join(' ')
          end
        elsif app = app_with_comments
          if MACINTOSH_REGEX.match?(app.comment[0])
            OperatingSystems.normalize_os(app.comment[1])
          elsif ANDROID_REGEX.match?(app.comment[0])
            OperatingSystems.normalize_os(app.comment[0])
          end
        end
      end

      ##
      # @return [String, nil]
      #     The platform
      def platform
        ua = self.to_s
        if IOS_REGEX.match?(ua)
          IOS
        elsif ANDROID_REGEX.match?(ua)
          ANDROID
        elsif app = detect_product(DARWIN)
          comment = app.comment.join unless app.comment.nil?
          X86_64_REGEX.match?(comment) ? MACINTOSH : IOS
        elsif app = reject { |agent| agent.comment.nil? || agent.comment.empty? }.first
          MACINTOSH if MACINTOSH_REGEX.match?(app.comment.join)
        end
      end

      ##
      # @return [String]
      #     The version
      def version
        if app = detect_product(DEMO) || detect_product(X)
          app.version
        elsif app = detect { |product| STITCHER_REGEX.match?(product) }
          app.version unless ANDROID_IOS_REGEX.match?(app.version.to_s)
        end
      end
    end
  end
end
