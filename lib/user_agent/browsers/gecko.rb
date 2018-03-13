class UserAgent
  module Browsers
    class Gecko < Base
      def self.extend?(agent)
        agent.application && agent.application.product == "Mozilla"
      end

      GECKO_BROWSERS = %w[
        PaleMoon
        Firefox
        Camino
        Iceweasel
        Seamonkey
      ].freeze

      def GeckoBrowsers # rubocop:disable Naming/MethodName
        warn("#{__method__} is deprecated. Please use GECKO_BROWSERS instead")
        GECKO_BROWSERS
      end

      def browser
        GECKO_BROWSERS.detect { |browser| respond_to?(browser) } || super
      end

      def version
        v = send(browser).version
        v.nil? ? super : v
      end

      def platform
        if (comment = application.comment) # rubocop:disable Style/GuardClause
          if comment[0] == "compatible" || comment[0] == "Mobile"
            nil
          elsif /^Windows / =~ comment[0]
            "Windows"
          else
            comment[0]
          end
        end
      end

      def security
        SECURITY[application.comment[1]] || :strong
      end

      def os
        if (comment = application.comment) # rubocop:disable Style/GuardClause
          i = if comment[1] == "U"
                2
              elsif /^Windows / =~ comment[0] || /^Android/ =~ comment[0]
                0
              elsif comment[0] == "Mobile"
                nil
              else
                1
              end

          return nil if i.nil?

          OperatingSystems.normalize_os(comment[i])
        end
      end

      def localization
        application.comment[3] if application.comment
      end
    end
  end
end
