class UserAgent
  module OperatingSystems
    class Ios < MacOsX
      REGEX = /CPU OS\s*([0-9_\.]+)?\slike Mac OS X/

      private

      def name
        "iOS"
      end
    end
  end
end
