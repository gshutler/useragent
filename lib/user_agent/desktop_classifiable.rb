class UserAgent
  # module to provide method to check if it is a desktop
  module DesktopClassifiable
    # Desktop platform types
    DESKTOP_PLATFORM_TYPES = %w[Windows Macintosh X11 Linux ChromeOS].freeze

    ##
    # @return [Boolean]
    #     False if it's a mobile
    #     Or check if it's a Windows, Macintosh, X11, Linux or ChromeOS
    def desktop?
      return false if mobile?

      DESKTOP_PLATFORM_TYPES.include?(platform)
    end
  end
end
