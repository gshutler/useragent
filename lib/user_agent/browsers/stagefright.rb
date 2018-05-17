class UserAgent
  module Browsers
    # stagefright/1.2 (Linux;Android 5.0.1)
    # SonyD5803 Build/23.0.1.A.5.77 stagefright/1.2 (Linux;Android 4.4.4)
    # Samsung SAMSUNG-SGH-I747 stagefright/1.2 (Linux;Android 4.4.2)
    # Samsung SM-G900T stagefright/Beyonce/1.1.9 (Linux;Android 5.1.1)
    class Stagefright < Base
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product =~ /stagefright/ }
      end

      def browser
        'Stagefright'
      end

      # Find the right application
      def application
        self.reject { |agent| agent.comment.nil? || agent.comment.empty? }.first
      end

      # Return the platform
      #
      # @return [String]
      def platform
        return unless application

        if application.comment.any? { |c| c =~ /Android/ }
          'Android'
        else
          application.comment[0]
        end
      end

      # Return the operating system
      #
      # @return [String]
      def os
        return unless application

        if pos = application.comment[0] =~ /Android/
          OperatingSystems.normalize_os(application.comment[0][pos..-1])
        end
      end
    end
  end
end
