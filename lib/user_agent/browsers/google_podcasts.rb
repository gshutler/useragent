class UserAgent
  module Browsers
    # Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) GSA/42.0.183854831 Mobile/13G36 Safari/601.1
    # Mozilla/5.0 (iPad; CPU OS 9_0_2 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) GSA/6.0.51363 Mobile/13A452 Safari/600.1.4
    # Mozilla/5.0 (Linux; Android 5.0.2; LG-V496 Build/LRX22G; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/53.0.2785.97 Safari/537.36 GSA/6.3.36.21.arm
    # Mozilla/5.0 (Linux; Android 8.1.0; Pixel Build/OPM2.171019.029; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36 GSA/7.8.26.21.arm64
    # GooglePodcasts/2.0.10 iPad/14.5 hw/iPad6_3
    # GooglePodcasts/2.0.10 iPhone/12.1 hw/iPhone11_2
    # GooglePodcasts/2.0.9 iPod_touch/14.4.1 hw/iPod9_1
    class GooglePodcasts < Webkit
      GOOGLE_PODCASTS = 'GooglePodcasts'
      GSA             = 'GSA'

      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == GSA || useragent.product == GOOGLE_PODCASTS }
      end

      def browser
        'Google Podcasts' # Google wants their agent to be reported as "Google Podcasts"
      end

      ##
      # @return [True] This is an mobile app
      def mobile?
        true
      end

      ##
      # @return [String]
      #     The OS version
      def os
        if application
          if application.comment[2].nil?
            OperatingSystems.normalize_os(application.comment[1])
          elsif /Android/.match?(application.comment[1])
            OperatingSystems.normalize_os(application.comment[1])
          end
        else
          app = detect_product('iPhone') || detect_product('iPad') || detect_product('iPod_touch')
          "iOS #{app.version}" if app && app.version
        end
      end

      ##
      # @return [String]
      #     The platform
      def platform
        if application
          if application.comment.any? { |c| /iPhone/.match?(c) }
            'iPhone'
          elsif application.comment.any? { |c| /iPad/.match?(c) }
            'iPad'
          elsif application.comment.any? { |c| /Android/.match?(c) }
            'Android'
          end
        else
          if detect_product('iPhone')
            'iPhone'
          elsif detect_product('iPad')
            'iPad'
          elsif detect_product('iPod_touch')
            'iPod touch'
          end
        end
      end

      # Gets the application version
      def version
        app = detect_product(GSA) || detect_product(GOOGLE_PODCASTS)
        app.version
      end
    end
  end
end
