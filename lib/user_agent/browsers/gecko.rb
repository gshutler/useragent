class UserAgent
  module Browsers
    module Gecko
      def self.extend?(agent)
        agent.application && agent.application.product == "Mozilla"
      end

      GeckoBrowsers = %w(
        Firefox
        Camino
        Iceweasel
        Seamonkey
      ).freeze

      def browser
        GeckoBrowsers.detect { |browser| respond_to?(browser) } || super
      end

      def version
        send(browser).version || super
      end

      def platform
        if comment = application.comment
          comment[0] == 'compatible' ? nil : comment[0]
        end
      end

      def security
        Security[application.comment[1]] || :strong
      end

      def os
        if comment = application.comment
          i = comment[1] == 'U' ? 2 : 1
          OperatingSystems.normalize_os(comment[i])
        end
      end

      def localization
        if comment = application.comment
          comment[3]
        end
      end
    end
  end
end
