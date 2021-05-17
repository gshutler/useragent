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
    # Pandora Audio/2102.1 (Linux;Android 9.1) ExoPlayerLib/2.9.6
    # Pandora/1811.1 Android/7.1.1 kelly (ExoPlayerLib1.5.14.1)
    # Pandora/2107 CFNetwork/1125.2 Darwin/19.4.0
    class Pandora < Webkit
      AUDIO               = 'Audio'
      EXO_PLAYER_LIB      = 'ExoPlayerLib'
      PANDORA             = 'Pandora'
      PANDORA_APP         = 'PandoraApp'
      PANDORA_AUDIO_REGEX = /Pandora Audio/.freeze
      PANDORA_DESKTOP_APP = 'PandoraDesktopApp'
      PANDORA_PRODUCTS    = [PANDORA, PANDORA_APP, PANDORA_DESKTOP_APP].freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| PANDORA_PRODUCTS.include?(useragent.product) } || PANDORA_AUDIO_REGEX.match?(agent.to_s)
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        PANDORA
      end

      ##
      # @return [String, nil]
      #     Gets the operating system
      def os
        os = super
        return os unless os.nil?

        if PANDORA_AUDIO_REGEX.match?(self.to_s) && app = detect_product(AUDIO)
          OperatingSystems.normalize_os(app.comment[0]) unless app.comment[0].nil?
        elsif app = detect_product(ANDROID)
          "#{ANDROID} #{app.version}"
        elsif app = detect_product(DARWIN)
          "#{IOS} #{OperatingSystems::Darwin::IOS[app.version.to_s]}"
        end
      end

      ##
      # @return [String, nil]
      #     Gets the application platform
      def platform
        platform = super
        return platform unless platform.nil? || platform.start_with?(EXO_PLAYER_LIB)

        ua = self.to_s
        if ANDROID_REGEX.match?(ua)
          ANDROID
        elsif DARWIN_REGEX.match?(ua)
          IOS
        end
      end

      ##
      # @return [String]
      #     Gets the application version
      def version
        app = if PANDORA_AUDIO_REGEX.match?(self.to_s)
                detect_product(AUDIO)
              else
                detect_product(PANDORA) || detect_product(PANDORA_APP) || detect_product(PANDORA_DESKTOP_APP)
              end
        app.version if app
      end
    end
  end
end
