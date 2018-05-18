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

      # Gets the platform
      #
      # @return [String] the platform
      def platform
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
          return version.index('/') ? version.split('/')[-1] : application.version
        end

        ua = self.to_s
        if pos = ua =~ /Android/
          ua[pos..-1].split()[1]
        elsif pos = ua =~ /iOS/
          ua[pos..-1].split()[1]
        elsif pos = ua =~ /Pocket Casts\//
          detect_product('Casts').version
        end
      end
    end
  end
end
