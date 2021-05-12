# frozen_string_literal: true

class UserAgent
  module Browsers
    # Linux UPnP/1.0 Sonos/44.2-53100-mainline_integ (ZP120)
    # Linux UPnP/1.0 Sonos/44.2-54250 (ZP90)
    # Linux UPnP/1.0 Sonos/48.2-57300-mcs9_dev_integ (ZPS11)
    # Linux UPnP/1.0 Sonos/65.1-15280-mainline_integ_alt_release (ZPS16)
    class Sonos < Base
      SONOS = 'Sonos'

      def self.extend?(agent)
        agent.detect { |useragent| useragent.product == SONOS }
      end

      def browser
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
