# frozen_string_literal: true

class UserAgent
  module Browsers
    # Linux UPnP/1.0 Sonos/44.2-53100-mainline_integ (ZP120)
    # Linux UPnP/1.0 Sonos/44.2-54250 (ZP90)
    # Linux UPnP/1.0 Sonos/48.2-57300-mcs9_dev_integ (ZPS11)
    # Linux UPnP/1.0 Sonos/65.1-15280-mainline_integ_alt_release (ZPS16)
    class Sonos < Base
      SONOS = 'Sonos'

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == SONOS }
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        SONOS
      end

      ##
      # @return [String] The platform
      def platform
        SONOS
      end

      ##
      # @return [True] Sonos is a speaker
      def speaker?
        true
      end

      # Return the application version
      #
      # @return [String]
      def version
        detect_product(SONOS).version
      end
    end
  end
end
