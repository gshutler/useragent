class UserAgent
  module Browsers
    # TuneIn Radio/26.8.1 (Linux;Android 8.0.0) ExoPlayerLib/2.12.2
    # TuneIn Radio Pro/26.2.1 (Linux;Android 9) ExoPlayerLib/2.12.2
    # TuneIn Radio Pro/17.8.1 (Android 24; SM-T813; Java)
    # TuneIn Radio/20.4.0; iPhone13,1; iOS/14.4.2
    # TuneIn Radio Pro/20.5.0; iPhone13,1; iOS/14.6
    # TuneIn Radio Pro/20.4.0; iPad8,7; iOS/14.4.2
    # Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) TuneIn/1.6.0 Chrome/69.0.3497.128 Electron/4.1.4 Safari/537.36
    # Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) TuneIn/1.16.0 Chrome/69.0.3497.128 Electron/4.2.8 Safari/537.36
    # Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) tunein/1.0.0 Chrome/69.0.3497.128 Electron/4.1.3 Safari/537.36

    # TuneIn%20Radio%20Enterprise/1 CFNetwork/808.2.16 Darwin/16.3.0
    # TuneIn%20Radio%20Pro/055708c CFNetwork/894 Darwin/17.4.0
    # TuneIn%20Radio%20Pro/11.4; iPhone11,8; iOS/13.3.1
    # TuneIn%20Radio%20Pro/12.5; iPod7,1; iOS/10.2
    # TuneIn%20Radio/1002 CFNetwork/887 Darwin/17.0.0
    # TuneIn%20Radio/11.4; iPad5,3; iOS/11.4
    class TuneIn < Base
      include DesktopClassifiable

      ANDROID_SDK_REGEX = /Android (?<sdk>[\d]+)/.freeze
      PRO               = 'Pro'
      RADIO             = 'Radio'
      TUNEIN            = 'TuneIn'
      TUNEIN_LOWER      = 'tunein'
      TUNEIN_REGEX      = /TuneIn(%20|\s)Radio((%20|\s)(Pro|Enterprise))*/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product.downcase == TUNEIN_LOWER } || TUNEIN_REGEX.match?(agent.to_s)
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        TUNEIN
      end

      # Gets the operating system
      #
      # @return [String, nil] the os
      def os
        if app = detect_product(IOS)
          [IOS, app.version].compact.join(' ') if app.version
        elsif app = detect_product(DARWIN)
          [IOS, OperatingSystems::Darwin::IOS[app.version.to_s]].compact.join(' ') if app.version
        elsif app = app_with_comments
          comments = app.comment.join
          if WINDOWS_NT_REGEX.match?(app.comment[0])
            OperatingSystems.normalize_os(app.comment[0])
          elsif ANDROID_REGEX.match?(comments)
            if comments.start_with?(LINUX)
              OperatingSystems.normalize_os(comments)
            elsif comments.start_with?(ANDROID) && matches = ANDROID_SDK_REGEX.match(comments)
              [ANDROID, OperatingSystems::Android::SDK[matches[:sdk]]].compact.join(' ') if matches[:sdk]
            end
          elsif app.comment[1]
            OperatingSystems.normalize_os(app.comment[1])
          end
        end
      end

      # Gets the platform
      #
      # @return [String, nil] the platform
      def platform
        ua = to_s

        case ua
        when ANDROID_REGEX
          ANDROID
        when IPHONE_REGEX
          IPHONE
        when IPAD_REGEX
          IPAD
        when IPOD_REGEX
          IPOD_TOUCH
        when DARWIN_REGEX, IOS_REGEX
          IOS
        when MACINTOSH_REGEX
          MACINTOSH
        when WINDOWS_REGEX
          WINDOWS
        when X11_REGEX
          X11
        end
      end

      ##
      # @return [String] Gets the application version
      def version
        app = detect_product(TUNEIN)
        return app.version if app && !app.version.to_s.empty?

        app = detect_product(PRO) || detect_product(RADIO)
        normalize_version(app ? app.version : application.version)
      end

      private

      ##
      # Normalize the version
      #   - remove ;
      #
      # @param version [Version]
      #     The app version
      # @return [String]
      #     normalized version
      def normalize_version(version)
        version.to_s.tr(';', '')
      end
    end
  end
end
