class UserAgent
  module Browsers
    # Pocket Casts BMID/E678F58F21
    # PocketCasts/1.0 (Pocket Casts Feed Parser; +http://pocketcasts.com/)
    # Shifty Jelly Pocket Casts, Android v4.5.3
    # Shifty Jelly Pocket Casts, iOS v4.3
    # Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Pocket Casts/1.1 Pocket Casts/1.1
    class PocketCasts < Base
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product =~ /PocketCasts/ } || agent.to_s =~ /Pocket Casts/
      end

      def browser
        'Pocket Casts'
      end

      # Gets the right application
      def application
        app = detect_product('PocketCasts')
        return app unless app.nil?
      end

      # Gets the operating system
      #
      # @return [String] the os
      def os
        application = reject { |agent| agent.comment.nil? || agent.comment.empty? }.first
        return if application.nil?

        if application.comment[0] =~ /Windows NT/
          OperatingSystems.normalize_os(application.comment[0])
        elsif application.comment[2].nil?
          OperatingSystems.normalize_os(application.comment[1])
        elsif application.comment[1] =~ /Android/
          OperatingSystems.normalize_os(application.comment[1])
        elsif (os_string = application.comment.detect { |c| c =~ OperatingSystems::IOS_VERSION_REGEX })
          OperatingSystems.normalize_os(os_string)
        end
      end

      # Gets the platform
      #
      # @return [String] the platform
      def platform
        application = reject { |agent| agent.comment.nil? || agent.comment.empty? }.first

        if application
          return 'Windows'    if application.comment[0] =~ /Windows/
          return 'BlackBerry' if application.comment[0] == 'BB10'
          return 'Android'    if application.comment.any? { |c| c =~ /Android/ }
        end

        ua = self.to_s
        if ua =~ /Android/
          'Android'
        elsif ua =~ /iOS/
          'iPhone'
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
        if pos = ua =~ /Android/
          normalize_version(ua[pos..-1].split[1])
        elsif pos = ua =~ /iOS/
          normalize_version(ua[pos..-1].split[1])
        elsif pos = ua =~ /Pocket Casts\//
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
