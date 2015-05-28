class UserAgent
  module OperatingSystems
    class Windows < Base
      VERSIONS = {
        "Windows NT 6.3"  => "Windows 8.1",
        "Windows NT 6.2"  => "Windows 8",
        "Windows NT 6.1"  => "Windows 7",
        "Windows NT 6.0"  => "Windows Vista",
        "Windows NT 5.2"  => "Windows XP x64 Edition",
        "Windows NT 5.1"  => "Windows XP",
        "Windows NT 5.01" => "Windows 2000, Service Pack 1 (SP1)",
        "Windows NT 5.0"  => "Windows 2000",
        "Windows NT 4.0"  => "Windows NT 4.0",
        "Windows 98"      => "Windows 98",
        "Windows 95"      => "Windows 95",
        "Windows CE"      => "Windows CE"
      }.freeze

      def match?
        VERSIONS.has_key? @os
      end

      def normalize
        VERSIONS[@os]
      end
    end
  end
end
