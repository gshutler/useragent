class UserAgent
  # module to provide method to check if it is a desktop
  module DesktopClassifiable
    ##
    # @return [Boolean]
    #     False if it's a mobile
    #     Or check if it's a Windows, Macintosh or X11
    def desktop?
      return false if mobile?

      %w[Windows Macintosh X11 Linux ChromeOS].include?(platform)
    end
  end
end
