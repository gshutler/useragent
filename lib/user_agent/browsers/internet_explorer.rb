class UserAgent
  module Browsers
    module InternetExplorer
      def self.extend?(agent)
        agent.application &&
          agent.application.comment &&
          agent.application.comment[0] == "compatible"
      end

      def browser
        "Internet Explorer"
      end

      def version
        application.comment[1].sub("MSIE ", "")
      end

      def compatibility
        application.comment[0]
      end

      def compatible?
        compatibility == "compatible"
      end

      def platform
        "Windows"
      end

      def os
        OperatingSystems.normalize_os(application.comment[2])
      end
    end
  end
end
