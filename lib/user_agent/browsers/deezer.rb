class UserAgent
  module Browsers
    # Deezer/6.2.28.73 (Android; 11; Mobile; fr) samsung SM-G973F
    # Deezer/6.0.10.201 (Android; 5.1.1; Tablet; nl) samsung SM-T280
    # Deezer/8.39.0.6 CFNetwork/1220.1 Darwin/20.3.0
    # Deezer/4.34.10 (Electron; windows/10.0.19041; Desktop; de)
    # Deezer/4.34.10 (Electron; osx/10.16.0; Desktop; en)
    # Deezer/4.18.50 (Electron; linux/5.11.0-16-generic; Desktop; us)
    # Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Deezer/4.25.0 Chrome/73.0.3683.121 Electron/5.0.10 Safari/537.36
    # Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Deezer/4.27.0 Chrome/73.0.3683.121 Electron/5.0.10 Safari/537.36
    # Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Deezer/4.27.0 Chrome/76.0.3809.146 Electron/6.1.12 Safari/537.36
    class Deezer < Base
      include DesktopClassifiable

      DEEZER        = 'Deezer'
      LINUX_REGEX   = /linux/.freeze
      LINUX_SLASH   = 'linux/'
      OSX_REGEX     = /osx/.freeze
      OSX_SLASH     = 'osx/'
      WINDOWS_REGEX = /[Ww]indows/.freeze
      WINDOWS_SLASH = 'windows/'

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == DEEZER }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        DEEZER
      end

      # Gets the operating system
      #
      # @return [String, nil] the os
      def os
        if app = detect_product(DARWIN)
          [IOS, OperatingSystems::Darwin::IOS[app.version.to_s]].compact.join(' ') if app.version
        elsif app = app_with_comments
          if app.comment[0] == ANDROID
            [ANDROID, app.comment[1]].compact.join(' ')
          elsif app.comment[1].to_s.start_with?(LINUX_SLASH)
            app.comment[1].sub(LINUX_SLASH, '')
          elsif app.comment[1].to_s.start_with?(OSX_SLASH)
            [MAC_OS, app.comment[1].sub(OSX_SLASH, '')].compact.join(' ')
          elsif app.comment[1].to_s.start_with?(WINDOWS_SLASH)
            [WINDOWS, app.comment[1].sub(WINDOWS_SLASH, '')].compact.join(' ')
          elsif WINDOWS_NT_REGEX.match?(app.comment[0])
            OperatingSystems.normalize_os(app.comment[0])
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
        when MACINTOSH_REGEX, OSX_REGEX
          MACINTOSH
        when WINDOWS_REGEX
          WINDOWS
        when X11_REGEX, LINUX_REGEX
          X11
        end
      end

      ##
      # @return [String] Gets the application version
      def version
        detect_product(DEEZER).version
      end
    end
  end
end
