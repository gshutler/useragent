class UserAgent
  module Browsers
    # Airr/3916 CFNetwork/1202 Darwin/20.1.0
    # Airr/3186 CFNetwork/1128.0.1 Darwin/19.6.0
    class Airr < Base
      AIRR       = 'Airr'
      AIRR_REGEX = /Airr/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| AIRR_REGEX.match?(useragent.product) }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        AIRR
      end

      ##
      # @return [Array]
      #     Gets the right application
      def application
        detect_product(AIRR)
      end

      ##
      # @return [Boolean] true for mobile
      def mobile?
        true
      end

      ##
      # The operating system is derived from the Darwin kernel version when present.
      #
      # @return [String] The operating system
      def os
        darwin  = detect_product(DARWIN)
        version = UserAgent::OperatingSystems::Darwin::IOS[darwin.version.to_s] if darwin

        [IOS, version].compact.join(' ')
      end

      ##
      # @return [String] This is an iPhone only app
      def platform
        IPHONE
      end
    end
  end
end
