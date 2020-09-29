# frozen_string_literal: true

class UserAgent
  module Browsers
    module AppleWatch
      ##
      # This class detects and handles the Pod2Watch browser on Apple Watch
      class Pod2Watch < Base
        # The darwin product (providing a kernel version)
        DARWIN = 'Darwin'

        # The Pod2Watch browser
        BROWSER = 'Pod2Watch'

        class << self
          ##
          # Check if this class is usable for at least one of the provided user agents
          #
          # @param agents [UserAgent::Browsers::Base]
          #     List of user agents to figure out if it could be a Pod2Watch browser on Apple Watch
          #
          # @return [Boolean]
          #     true, if this is the right class for the user agent
          def extend?(agents)
            agents.first.product.start_with?(BROWSER) if agents.size.positive?
          end
        end

        ##
        # The operating system is derived from the Darwin kernel version when present,
        # otherwise pulled from the comment.
        #
        # @return [String] The operating system
        def os
          darwin  = detect_product(DARWIN)
          version = if darwin
                      UserAgent::OperatingSystems::Darwin::WATCH_OS[darwin.version.to_s]
                    else
                      match = detect_comment_match(/watchOS\s(?<version>[\.\d]+)/)
                      match.named_captures['version'] if match
                    end

          [WATCH_OS, version].compact.join(' ')
        end

        ##
        # @return [UserAgent::Version, nil] The browser version
        def version
          find { |agent| !agent.version.nil? }&.version
        end
      end
    end
  end
end
