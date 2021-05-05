# frozen_string_literal: true

class UserAgent
  module Browsers
    # %D8%A7%D9%84%D8%A8%D9%88%D8%AF%D9%83%D8%A7%D8%B3%D8%AA/1430.27 CFNetwork/1150 Darwin/20.0.0
    # Podcasty/1400.173.3 CFNetwork/1085.4 Darwin/19.0.0 (x86_64)
    # Podcastit/1425.5 CFNetwork/1121.1.1 Darwin/19.2.0 (x86_64)
    # Balados/1400.173.3 CFNetwork/1085.4 Darwin/19.0.0 (x86_64)
    # %D7%A4%D7%95%D7%93%D7%A7%D7%90%D7%A1%D7%98%D7%99%D7%9D/1400.195 CFNetwork/1089 Darwin/19.0.0 (x86_64)
    # %E0%A4%AA%E0%A5%89%E0%A4%A1%E0%A4%95%E0%A4%BE%E0%A4%B8%E0%A5%8D%E0%A4%9F/1500.2 CFNetwork/1156 Darwin/20.0.0
    # Podcasti/1400.192 CFNetwork/1088.1 Darwin/19.0.0 (x86_64)
    # Podcastok/1425.5 CFNetwork/1121.1.2 Darwin/19.2.0 (x86_64)
    # %ED%8C%9F%EC%BA%90%EC%8A%A4%ED%8A%B8/1430.39 CFNetwork/1125 Darwin/19.4.0
    # Podkaster/1420.34 CFNetwork/1120 Darwin/19.0.0 (x86_64)
    # Podcasturi/1400.174 CFNetwork/1085.1 Darwin/19.0.0
    # %D0%9F%D0%BE%D0%B4%D0%BA%D0%B0%D1%81%D1%82%D1%8B/1500.3 CFNetwork/1156 Darwin/20.0.0
    # Podcaster/1400.173.4 CFNetwork/1085.4 Darwin/19.0.0
    # %E0%B8%9E%E0%B9%87%E0%B8%AD%E0%B8%94%E0%B8%84%E0%B8%B2%E0%B8%AA%E0%B8%97%E0%B9%8C/1425.5 CFNetwork/1121.2.2 Darwin/19.3.0
    # Podcast%E2%80%99ler/1420.30 CFNetwork/1120 Darwin/19.0.0 (x86_64)
    # %D0%9F%D0%BE%D0%B4%D0%BA%D0%B0%D1%81%D1%82%D0%B8/1430.33 CFNetwork/1121.4 Darwin/19.0.0 (x86_64)
    # %E6%92%AD%E5%AE%A2/1410.33 CFNetwork/1108 Darwin/19.0.0 (x86_64)
    # Podcasts/0 CFNetwork/1156 Darwin/20.0.0
    # Podcasts/1.0.0.218659818 CFNetwork/974.2.1 Darwin/18.0.0
    # Podcast/1 CFNetwork/901.1 Darwin/17.6.0
    # Podcast/22 CFNetwork/978.0.7 Darwin/18.6.0
    class ApplePodcasts < Webkit
      include DesktopClassifiable

      APPLE_PODCASTS_REGEX = /\A(
        # ca, da, de, el, en_AU, en_GB, en, es_419, es, fr, id, it, ja, ms, nl, pt_PT, vi, zh_HK, zh_TW
        Podcast(s?)
        # ar
        |البودكاست|%D8%A7%D9%84%D8%A8%D9%88%D8%AF%D9%83%D8%A7%D8%B3%D8%AA
        # cs, fi, hr, hu, ro, sv
        |Podcast(y|it|i|ok|uri|er)
        # fr_CA
        |Balados
        # he
        |פודקאסטים|%D7%A4%D7%95%D7%93%D7%A7%D7%90%D7%A1%D7%98%D7%99%D7%9D
        # hi
        |पॉडकास्ट|%E0%A4%AA%E0%A5%89%E0%A4%A1%E0%A4%95%E0%A4%BE%E0%A4%B8%E0%A5%8D%E0%A4%9F
        # ko
        |팟캐스트|%ED%8C%9F%EC%BA%90%EC%8A%A4%ED%8A%B8
        # no
        |Podkaster
        # ru, uk
        |Подкасты|Подкасти|%D0%9F%D0%BE%D0%B4%D0%BA%D0%B0%D1%81%D1%82%(D1%8B|D0%B8)
        # th
        |พ็อดคาสท์|%E0%B8%9E%E0%B9%87%E0%B8%AD%E0%B8%94%E0%B8%84%E0%B8%B2%E0%B8%AA%E0%B8%97%E0%B9%8C
        # tr
        |Podcast(’|%E2%80%99)ler
        # zh_CN
        |播客|%E6%92%AD%E5%AE%A2
        )\/.+CFNetwork\/
      /x.freeze

      def self.extend?(agent)
        APPLE_PODCASTS_REGEX.match?(agent.to_s)
      end

      def application
        detect_product('Darwin')
      end

      def browser
        'Apple Podcasts'
      end

      ##
      # @return [Boolean]
      #     This is a mobile app when platform is iOS
      def mobile?
        platform == 'iOS'
      end

      ##
      # @return [String]
      #     Macintosh for x86_64, otherwise iOS
      def platform
        if application && application.comment && application.comment.any? { |c| /x86_64/.match?(c) }
          'Macintosh'
        else
          'iOS'
        end
      end

      ##
      # The operating system is derived from the Darwin kernel version when present.
      #
      # @return [String] The operating system
      def os
        return unless application

        if platform == 'iOS'
          "iOS #{UserAgent::OperatingSystems::Darwin::IOS[application.version.to_s]}"
        else
          "macOS #{UserAgent::OperatingSystems::Darwin::MAC_OS[application.version.to_s]}"
        end
      end

      # Gets the application version
      def version
        self.first.version
      end
    end
  end
end
