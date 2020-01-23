# frozen_string_literal: true

class UserAgent
  module Browsers
    # Mozilla/5.0 (iPad; CPU OS 10_3_4 like Mac OS X) AppleWebKit/603.3.8 (KHTML, like Gecko) Mobile/14G61 Pandora/1812.1
    # Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89 Pandora/1901.1.1
    # Mozilla/5.0 (iPod touch; CPU iPhone OS 11_2_5 like Mac OS X) AppleWebKit/604.5.6 (KHTML, like Gecko) Mobile/15D60 Pandora/1908.1

    # Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Electron/4.2.10 Safari/537.36 PandoraApp/15.0.3
    # Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Electron/4.2.10 Safari/537.36 PandoraApp/15.0.2

    # Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) -0 Chrome/69.0.3497.128 Electron/4.1.4 Safari/537.36 PandoraDesktopApp/1.8.4
    # Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.106 Electron/4.0.6 Safari/537.36 PandoraDesktopApp/1.8.2
    class Pandora < Webkit
      PANDORA             = 'Pandora'
      PANDORA_APP         = 'PandoraApp'
      PANDORA_DESKTOP_APP = 'PandoraDesktopApp'
      PANDORA_PRODUCTS    = [PANDORA, PANDORA_APP, PANDORA_DESKTOP_APP].freeze

      def self.extend?(agent)
        agent.detect { |useragent| PANDORA_PRODUCTS.include?(useragent.product) }
      end

      def browser
        PANDORA
      end

      # Gets the application version
      def version
        str = if detect_product(PANDORA)
                pandora.version
              elsif detect_product(PANDORA_APP)
                pandoraapp.version
              elsif detect_product(PANDORA_DESKTOP_APP)
                pandoradesktopapp.version
              end

        Version.new(str)
      end
    end
  end
end
