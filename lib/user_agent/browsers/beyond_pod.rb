# frozen_string_literal: true

class UserAgent
  module Browsers
    # Mozilla/5.0 (Linux; U; en-us; BeyondPod 4)
    # Mozilla/5.0 (Linux; U; en-us; BeyondPod 4) Dynamo/1.0
    # BeyondPod for Android
    class BeyondPod < Base
      BEYOND_POD       = 'BeyondPod'
      BEYOND_POD_REGEX = /BeyondPod/.freeze

      ##
      # @param agent [Array]
      #     Array of useragent product
      # @return [Boolean]
      #     True if the useragent matches this browser
      def self.extend?(agent)
        BEYOND_POD_REGEX.match?(agent.to_s)
      end

      ##
      # @return [String]
      #     The browser name
      def browser
        BEYOND_POD
      end

      ##
      # @return [true] This is a mobile app
      def mobile?
        true
      end

      ##
      # @return [String] This is an Android app
      def platform
        ANDROID
      end
    end
  end
end
