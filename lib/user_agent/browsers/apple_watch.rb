# frozen_string_literal: true

class UserAgent
  module Browsers
    # (null)/(null) watchOS/5.0 model/Watch2 ,7 hwp/t8002 build/16R349 (6; dt:149)
    # (null)/(null) watchOS/5.1.1 model/Watch4 ,3 hwp/t8006 build/16S21 (6; dt:192)
    # (null)/(null) watchOS/5.2 model/Watch3 ,2 hwp/t8004 build/16T124 (6; dt:154)
    # (null)/(null) watchOS/6.0 model/Watch4 ,4 hwp/t8006 build/17R349 (6; dt:193)
    class AppleWatch < Base
      APPLE_WATCH     = 'Apple Watch'
      WATCHOS         = 'WatchOS'
      WATCHOS_PRODUCT = 'watchOS'

      class << self
        ##
        # Check if this class is usable for the user agent
        #
        # @return [Boolean] true if this is the right class for the useragent
        def extend?(agent)
          agent.detect { |useragent| useragent.product == WATCHOS_PRODUCT }
        end
      end

      ##
      # @return [String] The browser to report
      def browser
        APPLE_WATCH
      end

      ##
      # @return [String] The platform
      def platform
        APPLE_WATCH
      end

      ##
      # @return [String] The operating system
      def os
        WATCHOS
      end

      ##
      # @return [String] The application version
      def version
        detect_product(WATCHOS_PRODUCT).version
      end
    end
  end
end
