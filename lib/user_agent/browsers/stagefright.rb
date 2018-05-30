class UserAgent
  module Browsers
    # stagefright/1.2 (Linux;Android 5.0.1)
    # SonyD5803 Build/23.0.1.A.5.77 stagefright/1.2 (Linux;Android 4.4.4)
    # Samsung SAMSUNG-SGH-I747 stagefright/1.2 (Linux;Android 4.4.2)
    # Samsung SM-G900T stagefright/Beyonce/1.1.9 (Linux;Android 5.1.1)
    # AlcatelOneTouch-Alcatel_5044R-SVN/02; stagefright/1.2 (Linux;Android 7.0)
    # BLADE L111-stagefright/1.2 (Linux;Android 5.1)
    # Fire OS/5.1.1 stagefright/1.2 (Linux;Android 5.1.1) ,Dalvik/2.1.0 (Linux; U; Android 5.1.1; KFFOWI Build/LMY47O)
    # Fire OS/6.0 stagefright/1.2 (Linux;Android 7.1.2)
    # stagefright/1.2 (Linux;Android 5.0 Huawei HUAWEI GRA-L09 GRA-L09V100R001C150B134)
    # stagefright/1.2 (Linux;Android 4.0.3) Mozilla/5.0(iPad; U; CPU iPhone OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B314 Safari/531.21.10

    # LG-E615f/LG-E615f-V10p-SEP-02-2013 Player/NexPlayer 4.0 for Android (stagefright alternative) ,Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36
    # LG-D802/Desperate Rom LP UX4 V4 Player/LG Player 1.0 for Android 5.0.2 (stagefright alternative)
    # LG-H873/V15c Player/LG Player 1.0 for Android 7.0 (stagefright alternative)
    # LG-H955/V15c Player/LG Player 1.0 for Android 5.1.1 (stagefright alternative) BMID/E67AB269FB
    class Stagefright < Base
      ANDROID_REGEX                 = /Android/
      LG_PLAYER_REGEX               = /LG Player/
      NEXPLAYER_REGEX               = /NexPlayer/
      STAGEFRIGHT_ALT_PRODUCT_REGEX = /stagefright alternative/
      STAGEFRIGHT_PRODUCT_REGEX     = /stagefright/

      def self.extend?(agent)
        agent.detect { |useragent| STAGEFRIGHT_PRODUCT_REGEX.match?(useragent.product) } || STAGEFRIGHT_ALT_PRODUCT_REGEX.match?(agent.to_s)
      end

      def browser
        ua = self.to_s
        if NEXPLAYER_REGEX.match?(ua)
          return 'NexPlayer'
        elsif LG_PLAYER_REGEX.match?(ua)
          return 'LG Player'
        end

        if application && application.version
          version = application.version.to_s
          version.index('/') ? 'Stagefright/' + version.split('/')[0] : 'Stagefright'
        end
      end

      # Find the right application
      def application
        self.reject { |agent| !(STAGEFRIGHT_PRODUCT_REGEX.match?(agent.product)) || agent.comment.nil? || agent.comment.empty? }.first
      end

      # Return the platform
      #
      # @return [String]
      def platform
        'Android' if ANDROID_REGEX.match?(self.to_s)
      end

      # Return the operating system
      #
      # @return [String]
      def os
        if application && pos = application.comment[0] =~ ANDROID_REGEX
          return OperatingSystems.normalize_os(application.comment[0][pos..-1].split()[0..1].join(' '))
        end

        ua = self.to_s
        if pos = ua =~ ANDROID_REGEX
          OperatingSystems.normalize_os(ua[pos..-1].split()[0..1].join(' '))
        end
      end

      # Return the application version if any or the player version
      #
      # @return [String]
      def version
        if application && application.version
          version = application.version.to_s
          return version.index('/') ? version.split('/')[-1] : application.version
        end

        ua = self.to_s
        if pos = ua =~ NEXPLAYER_REGEX
          ua[pos..-1].split()[1]
        elsif pos = ua =~ LG_PLAYER_REGEX
          ua[pos..-1].split()[2]
        end
      end
    end
  end
end
