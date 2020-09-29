# frozen_string_literal: true

class UserAgent
  module Browsers
    ##
    # This module contains browsers on the Apple Watch platform
    module AppleWatch
      ##
      # This is the base class for all specific browsers on the Apple Watch platfrom
      class Base < UserAgent::Browsers::Base
        # The platform for browsers on Apple Watch
        PLATFORM = 'Apple Watch'

        # The Operating System
        WATCH_OS = 'watchOS'

        ##
        # @return [Boolean] false, Apple Watch is not considered a bot
        def bot?
          false
        end

        ##
        # @return [String] The browser to report
        def browser
          self.class::BROWSER
        end

        ##
        # @return [Boolean] true -- An Apple Watch is always mobile
        def mobile?
          true
        end

        ##
        # @return [String] The platform
        def platform
          PLATFORM
        end
      end
    end
  end
end
