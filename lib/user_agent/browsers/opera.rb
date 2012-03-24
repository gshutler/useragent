class UserAgent
  module Browsers
    module Opera
      # http://my.opera.com/community/openweb/idopera/
      OPERA_MATCHER = %r{
        ^([^/\s]+)            # Product
        /?([^\s]*)            # Old Version
        (\s\(([^\)]*)\))?     # Comment
        .*(Version/([^/\s]+)) # Version
      }x.freeze

      def self.parse(string)
        return nil if string.nil? || string == ""

        agents = []
        product = string.to_s.match(MATCHER)[1]
        if product && product == "Opera" && string =~ /Version\/\d+/
          match = string.to_s.match(OPERA_MATCHER)
          agents << UserAgent.new(match[1], match[6], match[4])

          # Trim the string based on the original matcher and continue
          standard_match = string.to_s.match(MATCHER)
          string = string[standard_match[0].length..-1].strip

          while m = string.to_s.match(MATCHER)
            agents << UserAgent.new(m[1], m[2], m[4])
            string = string[m[0].length..-1].strip
          end
          agents
        else
          nil
        end
      end

      def self.extend?(agent)
        agent.application && agent.application.product == "Opera"
      end

      def platform
        if application.comment.nil?
          nil
        elsif application.comment[0] =~ /Windows/
          "Windows"
        else
          application.comment[0]
        end
      end

      def security
        if application.comment.nil?
          :strong
        elsif platform == "Macintosh"
          Security[application.comment[2]]
        else
          Security[application.comment[1]]
        end
      end

      def os
        if application.comment.nil?
          nil
        elsif application.comment[0] =~ /Windows/
          OperatingSystems.normalize_os(application.comment[0])
        else
          application.comment[1]
        end
      end

      def localization
        if application.comment.nil?
          nil
        elsif platform == "Macintosh"
          application.comment[3]
        else
          application.comment[2]
        end
      end
    end
  end
end
