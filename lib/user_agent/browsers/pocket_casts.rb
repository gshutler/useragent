class UserAgent
  module Browsers
    # Pocket Casts BMID/E678F58F21
    # PocketCasts/1.0 (Pocket Casts Feed Parser; +http://pocketcasts.com/)
    # Shifty Jelly Pocket Casts, Android v4.5.3
    # Shifty Jelly Pocket Casts, iOS v4.3
    # Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Pocket Casts/1.1 Pocket Casts/1.1
    # Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Pocketcast/2.1.0 Chrome/58.0.3029.110 Molecule/2.1.0 Safari/537.36
    # Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Pocketcasts/3.0.11 Chrome/58.0.3029.110 Molecule/3.0.11 Safari/537.36
    # Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) PocketCasts/1.0.0 Chrome/59.0.3071.115 Electron/1.8.3 Safari/537.36
    class PocketCasts < Base
      include DesktopClassifiable

      ANDROID_REGEX            = /Android/
      IOS_REGEX                = /iOS/
      POCKETCASTS_REGEX        = /Pocket[Cc]asts?/
      POCKET_CASTS_REGEX       = /Pocket Casts/
      POCKET_CASTS_SLASH_REGEX = /Pocket Casts\//
      WINDOWS_NT_REGEX         = /Windows NT/

      def self.extend?(agent)
        agent.detect { |useragent| POCKETCASTS_REGEX.match?(useragent.product) } || POCKET_CASTS_REGEX.match?(agent.to_s)
      end

      def browser
        'Pocket Casts'
      end

      # Gets the right application
      def application
        detect_product('PocketCasts') || detect_product('Pocketcast')
      end

      # Gets the operating system
      #
      # @return [String] the os
      def os
        app = reject { |agent| agent.comment.nil? || agent.comment.empty? }.first
        return if app.nil? || app.product == 'PocketCasts'

        if WINDOWS_NT_REGEX.match?(app.comment[0])
          OperatingSystems.normalize_os(app.comment[0])
        elsif app.comment[2].nil?
          OperatingSystems.normalize_os(app.comment[1])
        elsif ANDROID_REGEX.match?(app.comment[1])
          OperatingSystems.normalize_os(app.comment[1])
        elsif (os_string = app.comment.detect { |c| OperatingSystems::IOS_VERSION_REGEX.match?(c) })
          OperatingSystems.normalize_os(os_string)
        end
      end

      # Gets the platform
      #
      # @return [String] the platform
      def platform
        app = reject { |agent| agent.comment.nil? || agent.comment.empty? }.first

        if app
          if /Windows/.match?(app.comment[0])
            return 'Windows'
          elsif /Macintosh/.match?(app.comment[0])
            return 'Macintosh'
          elsif app.comment.any? { |c| ANDROID_REGEX.match?(c) }
            return 'Android'
          end
        end

        ua = self.to_s
        if ANDROID_REGEX.match?(ua)
          'Android'
        elsif IOS_REGEX.match?(ua)
          'iOS'
        end
      end

      # Gets the version
      #
      # @return [String]
      def version
        if application && application.version
          version = application.version.to_s
          return version.index('/') ? normalize_version(version.split('/')[-1]) : normalize_version(application.version)
        end

        ua = self.to_s
        if pos = ua =~ ANDROID_REGEX
          normalize_version(ua[pos..-1].split[1])
        elsif pos = ua =~ IOS_REGEX
          normalize_version(ua[pos..-1].split[1])
        elsif POCKET_CASTS_SLASH_REGEX.match?(ua)
          normalize_version(detect_product('Casts').version)
        end
      end

      private

      # Normalize the version string
      # - remove starting 'v'
      def normalize_version(version)
        version = version.to_s
        return version[1..-1] if version.downcase.start_with?('v')
        version
      end
    end
  end
end
