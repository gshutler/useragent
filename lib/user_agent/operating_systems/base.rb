class UserAgent
  module OperatingSystems
    class Base
      def initialize(os)
        @os = os
      end

      def match?
        true
      end

      def normalize
        @os
      end
    end
  end
end
