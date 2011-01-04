class UserAgent
  module Browsers
    module InternetExplorer
      def self.extend?(agent)
        agent.application &&
          agent.application.comment &&
          agent.application.comment[0] == "compatible" &&
          agent.application.comment[1] =~ /MSIE/
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

      # Before version 4.0, Chrome Frame declared itself (unversioned) in a comment;
      # as of 4.0 it declares itself as a separate product with a version.

      def chromeframe
        application.comment.include?("chromeframe") || detect_product("chromeframe")
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
