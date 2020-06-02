class UserAgent
  module Browsers
    class BaiduBrowser < Base
      def self.extend?(agent)
        agent.any? { |agent| agent.product == "baidubrowser" }
      end

      def browser
        "Baidu Browser"
      end

      def version
        detect_product("baidubrowser").version
      end

      def platform
        if application.comment.any? { |c| c =~ /Android/ }
          "Android"
        else
          application.comment[0]
        end
      end

      def os
        OperatingSystems.normalize_os(os_comment)
      end

      private

      def os_comment
        application.comment.detect { |c| c =~ /Android/ } || application.comment[0]
      end
    end
  end
end
