# frozen_string_literal: true

class UserAgent
  module Browsers
    module AppleWatch
      ##
      # This class detects and handles the ATC browser on Apple Watch
      class ATC < Base
        # The browser string
        BROWSER = 'AirTraffic.framework'

        # The build within the comment
        BUILD = 'build'

        # The product string identifying the AirTraffic.framework browser
        PRODUCT_ATC = 'atc'

        # The product string identifying the broken versions of this browser
        PRODUCT_NULL = '(null)'

        # The required products in order to consider using this extension
        PRODUCTS = [PRODUCT_ATC, PRODUCT_NULL].freeze

        class << self
          ##
          # Check if this class is usable for at least one of the provided user agents
          #
          # @param agents [UserAgent::Browsers::Base]
          #     List of user agents to figure out if it could be an ATC browser on Apple Watch
          #
          # @return [Boolean]
          #     true, if this is the right class for the user agent
          def extend?(agents)
            agents.find { |user_agent| PRODUCTS.include?(user_agent.product.downcase) } &&
              agents.find { |user_agent| user_agent.product.casecmp(Base::WATCH_OS).zero? }
          end
        end

        ##
        # @return [String] The operating system with the version of the watchOS product
        def os
          ua = detect_product(WATCH_OS)

          "#{WATCH_OS} #{ua.version}".strip
        end

        ##
        # @return [UserAgent::Version, nil] The browser version
        def version
          atc_version   = detect_product(PRODUCT_ATC)&.version
          build_version = detect_product(BUILD)&.version

          return atc_version unless atc_version && build_version

          UserAgent::Version.new("#{atc_version}.#{build_version}")
        end
      end
    end
  end
end
