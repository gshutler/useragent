require 'user_agent/operating_systems/base'
require 'user_agent/operating_systems/windows'
require 'user_agent/operating_systems/mac_os_x'
require 'user_agent/operating_systems/ios'

class UserAgent
  module OperatingSystems
    extend self

    def normalize_os(os_string)
      [Windows, MacOsX, Ios, Base].each do |klass|
        os = klass.new(os_string)
        return os.normalize if os.match?
      end
    end
  end
end
