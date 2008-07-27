class UserAgent
  module Browsers
    module All
      include Comparable

      def <=>(other)
        if respond_to?(:browser) && other.respond_to?(:browser) &&
            browser == other.browser
          version <=> other.version
        else
          false
        end
      end

      def eql?(other)
        self == other
      end

      def to_s
        to_str
      end

      def to_str
        join(" ")
      end

      def [](product)
        each do |user_agent|
          if user_agent.product.to_s.downcase == product.to_s.downcase
            return user_agent
          end
        end
        nil
      end

      def application
        first
      end

      def browser
        application.product
      end

      def version
        application.version
      end

      def method_missing(method, *args, &block)
        self[method] || super
      end
    end
  end
end
