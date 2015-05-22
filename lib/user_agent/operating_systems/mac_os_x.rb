class UserAgent
  module OperatingSystems
    class MacOsX < Base
      REGEX = /(?:Intel|PPC) Mac OS X\s*([0-9_\.]+)?/

      def match?
        return false if @os.nil?
        (@matched_data = @os.match(self.class::REGEX)).nil? ? false : true
      end

      def normalize
        "#{name} #{version}".strip
      end

      private

      def name
        "OS X"
      end

      def version
        @matched_data[1].gsub('_', '.') if @matched_data[1]
      end
    end
  end
end
