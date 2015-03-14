require 'user_agent/browsers/base'
require 'user_agent/browsers/chrome'
require 'user_agent/browsers/gecko'
require 'user_agent/browsers/internet_explorer'
require 'user_agent/browsers/opera'
require 'user_agent/browsers/webkit'

class UserAgent
  module Browsers
    Security = {
      "N" => :none,
      "U" => :strong,
      "I" => :weak
    }.freeze

    def self.all
      [InternetExplorer, Opera, Chrome, Webkit, Gecko]
    end

    def self.extend(array)
      all.each do |extension|
        return extension.new(array) if extension.extend?(array)
      end
      array
    end
  end
end
