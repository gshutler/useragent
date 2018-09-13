class UserAgent
  module Browsers
    class GoogleAssistant < Webkit
      # Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) GSA/42.0.183854831 Mobile/13G36 Safari/601.1
      # Mozilla/5.0 (iPad; CPU OS 9_0_2 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) GSA/6.0.51363 Mobile/13A452 Safari/600.1.4
      # Mozilla/5.0 (Linux; Android 5.0.2; LG-V496 Build/LRX22G; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/53.0.2785.97 Safari/537.36 GSA/6.3.36.21.arm
      # Mozilla/5.0 (Linux; Android 8.1.0; Pixel Build/OPM2.171019.029; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36 GSA/7.8.26.21.arm64
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == 'GSA' }
      end

      def browser
        'Google Podcasts' # Google wants their agent to be reported as "Google Podcasts"
      end

      # Gets the application version
      def version
        detect_product('GSA').version
      end
    end
  end
end
