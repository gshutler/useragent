class UserAgent
  module Browsers
    module Opera
      def self.extend?(agent)
        agent.application && agent.application.product == "Opera"
      end

      def version
        if product = detect_product('Version')
          product.version
        else
          super
        end
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
