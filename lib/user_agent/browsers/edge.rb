class UserAgent
  module Browsers
    class Edge < Base
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
        OperatingSystems.normalize_os(application.comment.join('; ').match(/Windows NT [\d\.]+|Windows Phone (OS )?[\d\.]+/).to_s)
      end
    end
  end
end
