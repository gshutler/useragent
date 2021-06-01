class UserAgent
  module OperatingSystems
    ANDROID_VERSION_REGEX = /[Aa]ndroid v?(?<version>[\d\.]+)/.freeze
    IOS_VERSION_REGEX     = /CPU (?:iPhone |iPod )?OS ([\d_]+) like Mac OS X/.freeze

    Windows = {
      "Windows NT 10.0" => "Windows 10",
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

    def self.normalize_os(os)
      Windows[os] || normalize_mac_os_x(os) || normalize_ios(os) || normalize_chrome_os(os) || normalize_android(os) || os
    end

    private
      ##
      # @param os [String]
      #     The OS string
      # @return [String]
      #     An Android normalized OS string
      def self.normalize_android(os)
        # named captures to local var version
        if matches = ANDROID_VERSION_REGEX.match(os)
          if matches[:version].nil?
            "Android"
          else
            "Android #{matches[:version]}"
          end
        end
      end

      def self.normalize_chrome_os(os)
        if os =~ /CrOS\s([^\s]+)\s(\d+(\.\d+)*)/
          if $2.nil?
            "ChromeOS"
          else
            version = $2
            "ChromeOS #{version}"
          end
        end
      end

      def self.normalize_ios(os)
        if os =~ IOS_VERSION_REGEX
          if $1.nil?
            "iOS"
          else
            version = $1.tr('_', '.')
            "iOS #{version}"
          end
        end
      end

      def self.normalize_mac_os_x(os)
        if os =~ /(?:Intel|PPC) Mac OS X\s*([0-9_\.]+)?/
          if $1.nil?
            "OS X"
          else
            version = $1.tr('_', '.')
            "OS X #{version}"
          end
        end
      end
  end
end
