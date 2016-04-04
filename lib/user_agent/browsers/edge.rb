class UserAgent
  module Browsers
    class Edge < Base
      OS_REGEXP = /Windows NT [\d\.]+|Windows Phone (OS )?[\d\.]+/

      def self.extend?(agent)
        agent.last && agent.last.product == "Edge"
      end

      def browser
        "Edge"
      end

      def version
        last.version
      end

      def platform
        "Windows"
      end

      def os
        OperatingSystems.normalize_os(os_comment)
      end

      private

      def os_comment
        if os_agent = detect { |useragent| comment_os_match(useragent) }
          comment_os_match(os_agent).to_s
        end
      end

      def comment_os_match(useragent)
        useragent.comment && useragent.comment.join("; ").match(OS_REGEXP)
      end
    end
  end
end
