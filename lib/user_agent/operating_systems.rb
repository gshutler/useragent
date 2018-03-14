class UserAgent
  module OperatingSystems
    IOS_VERSION_REGEX = /CPU (?:iPhone |iPod )?OS ([\d_]+) like Mac OS X/
    CHROMEOS_REGEX = /CrOS\s([^\s]+)\s(\d+(\.\d+)*)/
    MACOS_REGEX = /(?:Intel|PPC) Mac OS X\s*([0-9_\.]+)?/

    WINDOWS = {
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
      "Windows CE"      => "Windows CE",
    }.freeze

    @windows_warned = false
    class << self
    def Windows # rubocop:disable Naming/MethodName
      unless @windows_warned
        warn("#{__method__} is deprecated. Please use WINDOWS instead")
        @windows_warned = true
      end
      WINDOWS
    end

    def normalize_os(os)
      WINDOWS[os] || normalize_mac_os_x(os) || normalize_ios(os) || normalize_chrome_os(os) || os
    end

      private

    def normalize_chrome_os(os)
      if os =~ CHROMEOS_REGEX && Regexp.last_match(2).nil?
        "ChromeOS"
      elsif os =~ CHROMEOS_REGEX
        version = Regexp.last_match(2)
        "ChromeOS #{version}"
      end
    end

    def normalize_ios(os)
      if os =~ IOS_VERSION_REGEX && Regexp.last_match(1).nil?
        "iOS"
      elsif os =~ IOS_VERSION_REGEX
        version = Regexp.last_match(1).tr("_", ".")
        "iOS #{version}"
      end
    end

    def normalize_mac_os_x(os)
      if os =~ MACOS_REGEX && Regexp.last_match(1).nil?
        "OS X"
      elsif os =~ MACOS_REGEX
        version = Regexp.last_match(1).tr("_", ".")
        "OS X #{version}"
      end
    end
    end
  end
end
