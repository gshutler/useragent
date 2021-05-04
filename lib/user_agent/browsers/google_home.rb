class UserAgent
  module Browsers
    class GoogleHome < Webkit
      # Mozilla/5.0 (Linux; Android 6.0.1; Build/M-MMB29M-rzs-us-sf-bld2-19HP-08.02.AM) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.41 Safari/537.36 CrKey/1.29.104695
      # Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3398.0 Safari/537.36 CrKey/1.34.119222
      # Mozilla/5.0 (X11; Linux armv7l) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.71 Safari/537.36 CrKey/1.23.85114
      # Mozilla/5.0 (Linux; Android 8.0; Build/OPR2.170623.027) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.147 Safari/537.36 CrKey/1.31.115279
      # Mozilla/5.0 (Linux; Android 7.0; FRD-L04 Build/HUAWEIFRD-L04; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36 CrKey
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == 'CrKey' }
      end

      def browser
        'Google Home'
      end

      def speaker?
        true
      end

      # Gets the application version
      def version
        detect_product('CrKey').version
      end
    end
  end
end
