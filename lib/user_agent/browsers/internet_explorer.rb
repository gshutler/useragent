class UserAgent
  module Browsers
    class InternetExplorer < Base
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
        if version = application.comment[1][/MSIE ([\d\.]+)/, 1]
          Version.new(version)
        end
      end

      def compatibility_view?
        version == "7.0" && application.comment.detect { |c| c['Trident/'] }
      end

      # Before version 4.0, Chrome Frame declared itself (unversioned) in a comment;
      # as of 4.0 it can declare itself versioned in a comment
      # or as a separate product with a version
      def chromeframe
        cf = application.comment.include?("chromeframe") || detect_product("chromeframe")
        return cf if cf
        cf_comment = application.comment.detect { |c| c['chromeframe/'] }
        cf_comment ? UserAgent.new(*cf_comment.split('/', 2)) : nil
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
